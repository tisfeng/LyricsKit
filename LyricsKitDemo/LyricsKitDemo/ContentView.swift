//
//  ContentView.swift
//  LyricsKitDemo
//
//  Created by tisfeng on 2024/11/22.
//

import Combine
import LyricsService
import SwiftUI

class LyricsWrapper: ObservableObject {
    @Published var lyrics: Lyrics?
}

struct ContentView: View {
    @State private var searchText = "一生不变 李克勤"
    @State private var searchResults: [Lyrics] = []
    @State private var isLoading = false
    @State private var error: Error?
    @State private var selectedLyrics: String?

    private var provider: LyricsProviders.Group = .init(service: [.qq, .netease, .kugou])
    private var searchCanceller = SearchCanceller()

    var body: some View {
        VStack {
            TextField("搜索...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    searchLyrics()
                }

            HSplitView {
                VStack {
                    if isLoading {
                        ProgressView()
                    } else {
                        Table(searchResults, selection: $selectedLyrics) {
                            TableColumn("歌曲") { lyrics in
                                Text(lyrics.idTags[.title] ?? "未知歌曲")
                            }
                            TableColumn("歌手") { lyrics in
                                Text(lyrics.idTags[.artist] ?? "未知歌手")
                            }
                            TableColumn("专辑") { lyrics in
                                Text(lyrics.idTags[.album] ?? "未知专辑")
                            }
                            TableColumn("来源") { lyrics in
                                Text(lyrics.metadata.service?.rawValue ?? "未知来源")
                            }
                        }
                    }

                    Spacer()
                }
                .frame(minWidth: 400, maxWidth: .infinity)

                ScrollView {
                    if let lyrics = selectedLyrics {
                        Text(lyrics.description)
                            .padding()
                    } else {
                        Text("请选择歌曲")
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                .frame(minWidth: 300, maxWidth: .infinity)
            }

            if let error = error {
                Text("搜索失败: \(error.localizedDescription)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .onAppear {
            searchLyrics()
        }
    }

    func searchLyrics() {
        guard !searchText.isEmpty else { return }

        let searchReq = LyricsSearchRequest(
            searchTerm: .keyword(searchText),
            duration: 0
        )

        isLoading = true
        searchResults = []
        error = nil

        searchCanceller.cancellable = provider.lyricsPublisher(request: searchReq)
            .sink(
                receiveCompletion: { completion in
                    isLoading = false
                    if case .failure(let err) = completion {
                        error = err
                    }
                },
                receiveValue: { lyrics in
                    searchResults.append(lyrics)
                }
            )
    }
}


private class SearchCanceller {
    var cancellable: Cancellable?
}

extension Lyrics: @retroactive Identifiable {
    public var id: String { description }

}

#Preview {
    ContentView()
}
