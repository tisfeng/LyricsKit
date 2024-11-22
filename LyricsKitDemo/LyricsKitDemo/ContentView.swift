//
//  ContentView.swift
//  LyricsKitDemo
//
//  Created by tisfeng on 2024/11/22.
//

import Combine
import LyricsService
import SwiftUI

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
            TextField("Search...", text: $searchText)
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
                            TableColumn("Song") { lyrics in
                                Text(lyrics.idTags[.title] ?? "Unknown song")
                            }
                            TableColumn("Artist") { lyrics in
                                Text(lyrics.idTags[.artist] ?? "Unknown artist")
                            }
                            TableColumn("Album") { lyrics in
                                Text(lyrics.idTags[.album] ?? "Unknown album")
                            }
                            TableColumn("Source") { lyrics in
                                Text(lyrics.metadata.service?.rawValue ?? "Unknown source")
                            }
                        }
                    }

                    Spacer()
                }
                .frame(minWidth: 400, maxWidth: .infinity)

                ScrollView {
                    VStack(alignment: .leading) {
                        if let lyrics = selectedLyrics {
                            Text(lyrics.description)
                                .textSelection(.enabled)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        } else {
                            Text("Select a song to view the lyrics")
                                .foregroundColor(.secondary)
                                .padding()
                        }
                    }
                }
                .frame(minWidth: 300, maxWidth: .infinity)
            }

            if let error = error {
                Text("Search failed: \(error.localizedDescription)")
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
            .cancel(after: 10, scheduler: DispatchQueue.main)
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
