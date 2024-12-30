//
//  LyricsSearchService.swift
//  LyricsKit
//
//  Created by tisfeng on 2024/11/26.
//

import Combine
import Foundation
import SwiftUI

@MainActor
public class LyricsSearchService: ObservableObject {
    public var provider: LyricsProviders.Group

    @Published public var searchText: String
    @Published public var lyricsList: [Lyrics] = []
    @Published public var isLoading = false

    private var searchCanceller: AnyCancellable?

    public init(
        searchText: String = "",
        providers: [LyricsProviders.Service] = [.qq, .netease, .kugou],
        autoSearch: Bool = true
    ) {
        self.searchText = searchText
        self.provider = .init(service: providers)

        if autoSearch && !searchText.isEmpty {
            isLoading = true
            Task {
                await searchLyrics()
            }
        }
    }

    /// Search lyrics with optional text
    /// - Parameter text: Optional search text. If nil, uses current searchText
    /// - Returns: Array of lyrics sorted by quality
    @discardableResult
    public func searchLyrics(with text: String? = nil) async -> [Lyrics] {
        let searchText = text ?? searchText
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return []
        }

        isLoading = true
        lyricsList = []

        let results = await fetchLyrics(for: searchText)
            .sorted { $0.quality > $1.quality }

        // Update UI state
        lyricsList = results
        isLoading = false

        return results
    }

    /// Fetch lyrics from providers
    /// - Parameter text: Search text
    /// - Returns: Array of unsorted lyrics
    private func fetchLyrics(for text: String) async -> [Lyrics] {
        let searchReq = LyricsSearchRequest(
            searchTerm: .keyword(text),
            duration: 0
        )

        return await withCheckedContinuation { continuation in
            var results: [Lyrics] = []

            searchCanceller = provider.lyricsPublisher(request: searchReq)
                .timeout(.seconds(10), scheduler: DispatchQueue.lyricsQueue)
                .receive(on: DispatchQueue.lyricsQueue)
                .sink(
                    receiveCompletion: { _ in
                        continuation.resume(returning: results)
                    },
                    receiveValue: { lyrics in
                        results.append(lyrics)
                    }
                )
        }
    }

    /// Cancel ongoing search
    public func cancelSearch() {
        searchCanceller?.cancel()
    }
}

extension DispatchQueue {
    static let lyricsQueue = DispatchQueue(label: "lyricsQueue")
}
