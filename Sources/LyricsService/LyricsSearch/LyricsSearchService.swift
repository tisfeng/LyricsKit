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
    @Published public var isLoading: Bool

    private var searchCanceller: AnyCancellable?

    public init(
        searchText: String = "",
        providers: [LyricsProviders.Service] = [.qq, .netease, .kugou],
        autoSearch: Bool = true,
        isLoading: Bool = false
    ) {
        self.searchText = searchText
        self.provider = .init(service: providers)
        self.isLoading = isLoading

        if autoSearch && !searchText.isEmpty {
            self.isLoading = true
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
        // Cancel previous search if any
        cancelSearch()
        
        isLoading = true

        if let text {
            searchText = text
        }

        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            isLoading = false
            lyricsList = []
            return []
        }

        lyricsList = []

        let results = await fetchLyrics(for: searchText)
            .sorted { $0.quality > $1.quality }

        // Only update UI state if search wasn't cancelled
        if isLoading {
            lyricsList = results
            isLoading = false
        }

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
                .receive(on: DispatchQueue.main)
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

    /// Cancel ongoing search and reset states
    public func cancelSearch() {
        searchCanceller?.cancel()
        searchCanceller = nil
        isLoading = false
    }
}

extension DispatchQueue {
    static let lyricsQueue = DispatchQueue(label: "com.lyricskit.queue")
}
