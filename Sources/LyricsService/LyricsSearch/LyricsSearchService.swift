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
    @Published private(set) public var isLoading = false

    private var searchCanceller: AnyCancellable?

    public init(
        searchText: String = "",
        providers: [LyricsProviders.Service] = LyricsProviders.Service.allCases,
        autoSearch: Bool = true
    ) {
        self.searchText = searchText
        self.provider = .init(service: providers)

        if autoSearch && !searchText.isEmpty {
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

        if let text {
            searchText = text
        }

        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            lyricsList = []
            return []
        }

        lyricsList = []
        return await fetchLyrics(for: searchText)
    }

    /// Fetch lyrics from providers
    /// - Parameter text: Search text
    /// - Returns: Array of sorted lyrics
    private func fetchLyrics(for text: String) async -> [Lyrics] {
        isLoading = true
        defer { isLoading = false }

        return await withCheckedContinuation { continuation in
            var allResults: [Lyrics] = []

            searchCanceller = provider.lyricsPublisher(
                request: .init(searchTerm: .keyword(text), duration: 0)
            )
            .timeout(.seconds(10), scheduler: DispatchQueue.lyricsQueue)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in
                    continuation.resume(returning: allResults)
                },
                receiveValue: { lyrics in
                    allResults.append(lyrics)
                    self.lyricsList = allResults.sorted { $0.quality > $1.quality }
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
