//
//  ContentView.swift
//  LyricsKitDemo
//
//  Created by tisfeng on 2024/11/22.
//

import LyricsService
import SwiftUI

struct ContentView: View {

    @State private var lyrics: Lyrics?
    @State private var isLoading = false
    @State private var error: Error?

    private var provider: LyricsProviders.Group = .init(service: [.netease])

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(lyrics?.description ?? "暂无歌词")
                    .multilineTextAlignment(.center)
            }

            if let error = error {
                Text("加载失败: \(error.localizedDescription)")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .onAppear {
            test()
        }
    }

    func test() {

        // create a search request
        let song = "一生不变"
        let artist = "李克勤"
        let duration = 312.0
        let searchReq = LyricsSearchRequest(
            searchTerm: .info(title: song, artist: artist),
            duration: duration
        )

        // search
        isLoading = true
        provider.lyricsPublisher(request: searchReq)
            .sink(
                receiveCompletion: { completion in
                    isLoading = false
                    if case .failure(let err) = completion {
                        self.error = err
                    }
                },
                receiveValue: { lyrics in
                    self.lyrics = lyrics
                    print(lyrics)
                }
            )
    }
}

#Preview {
    ContentView()
}
