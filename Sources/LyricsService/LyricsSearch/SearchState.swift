//
//  SearchState.swift
//  LyricsKit
//
//  Created by tisfeng on 2024/12/28.
//

import Foundation

public class SearchState: ObservableObject {
    @Published public var searchText: String = ""
    @Published public var lyricsList: [Lyrics] = []
    public var initialSearch: Bool
    public var searchService: LyricsSearchService

    @Published public var isLoading = false
    @Published public var error: Error?

    public init(
        searchText: String = "",
        lyricsList: [Lyrics] = [],
        initialSearch: Bool = true,
        searchService: LyricsSearchService = .init()
    ) {
        self.searchText = searchText
        self.lyricsList = lyricsList
        self.initialSearch = initialSearch
        self.searchService = searchService

        if initialSearch {
            isLoading = true

            Task { @MainActor in
                await performSearch()
            }
        }
    }

    @MainActor
    public func performSearch() async {
        isLoading = true
        lyricsList = []
        error = nil

        do {
            let lyricsList = try await searchService.searchLyrics(keyword: searchText)
            self.lyricsList = lyricsList.sorted { $0.quality > $1.quality }
            isLoading = false
        } catch {
            isLoading = false
            self.error = error
        }
    }
}
