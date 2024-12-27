//
//  LyricsSearchView.swift
//  LyricsXCore
//
//  Created by tisfeng on 2024/11/23.
//

import Combine
import SwiftUI

@available(macOS 12.0, *)
public struct LyricsSearchView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [Lyrics] = []
    @State private var isLoading = false
    @State private var error: Error?

    private let onLyricsSelected: ((Lyrics) -> Void)?
    private let searchService: LyricsSearchService

    public init(searchText: String = "", onLyricsSelected: ((Lyrics) -> Void)? = nil) {
        self.onLyricsSelected = onLyricsSelected
        _searchText = State(initialValue: searchText)
        searchService = .init()
    }

    public var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    performSearch()
                }

            if isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                LyricsResultView(searchResults: searchResults, onLyricsSelected: onLyricsSelected)
            }

            if let error = error {
                Text("Search failed: \(error.localizedDescription)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .frame(minWidth: 1000, minHeight: 600)
        .onAppear {
            performSearch()
        }
    }

    private func performSearch() {
        isLoading = true
        searchResults = []
        error = nil

        Task {
            do {
                searchResults = try await searchService.searchLyrics(keyword: searchText)
                isLoading = false
            } catch {
                isLoading = false
                self.error = error
            }
        }
    }
}

/// View for displaying lyrics search results in a split view
@available(macOS 12.0, *)
public struct LyricsResultView: View {
    let searchResults: [Lyrics]
    let onLyricsSelected: ((Lyrics) -> Void)?
    
    @State private var selectedLyricsDescription: String?
    
    public var body: some View {
        HSplitView {
            // Left side: Results table
            LyricsTableView(
                searchResults: searchResults,
                selectedLyricsDescription: $selectedLyricsDescription
            )
            .frame(minWidth: 650, maxWidth: .infinity)
            
            // Right side: Selected lyrics detail
            LyricsDetailView(
                lyrics: getSelectedLyrics(selectedLyricsDescription),
                onLyricsSelected: onLyricsSelected
            )
            .frame(minWidth: 250, maxWidth: .infinity)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(SwiftUI.Color.secondary.opacity(0.3))
        }
        .padding()
    }
    
    private func getSelectedLyrics(_ lyricsDescription: String?) -> Lyrics? {
        searchResults.first { $0.description == lyricsDescription?.description }
    }
}

/// View for displaying the lyrics search results table
@available(macOS 12.0, *)
public struct LyricsTableView: View {
    let searchResults: [Lyrics]
    @Binding var selectedLyricsDescription: String?
    
    public var body: some View {
        VStack {
            Table(searchResults, selection: $selectedLyricsDescription) {
                TableColumn("Source") { lyrics in
                    Text(lyrics.metadata.service?.rawValue ?? "Unknown")
                }
                TableColumn("Song") { lyrics in
                    Text(lyrics.idTags[.title] ?? "Unknown")
                }
                TableColumn("Artist") { lyrics in
                    Text(lyrics.idTags[.artist] ?? "Unknown")
                }
                TableColumn("Album") { lyrics in
                    Text(lyrics.idTags[.album] ?? "Unknown")
                }
                TableColumn("Duration") { lyrics in
                    Text(showLength(of: lyrics))
                }
                TableColumn("Cover") { lyrics in
                    LyricsCoverView(coverURL: lyrics.metadata.artworkURL, showDefaultCover: true)
                }
            }
            .tableStyle(.inset)
            Spacer()
        }
    }
}

/// View for displaying the selected lyrics detail
@available(macOS 12.0, *)
public struct LyricsDetailView: View {
    let lyrics: Lyrics?
    let onLyricsSelected: ((Lyrics) -> Void)?
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let lyrics = lyrics {
                    Button("Use Lyrics") {
                        onLyricsSelected?(lyrics)
                    }
                    .padding()

                    if let service = lyrics.metadata.service {
                        Text(service.rawValue)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                    }

                    LyricsCoverView(coverURL: lyrics.metadata.artworkURL, size: 200)
                        .padding(.horizontal)

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
    }
}

/// View for displaying lyrics cover image
@available(macOS 12.0, *)
private struct LyricsCoverView: View {
    let coverURL: URL?
    var size: CGFloat = 40
    var showDefaultCover: Bool = false
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            if let coverURL = coverURL {
                AsyncImage(url: coverURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size, height: size)
                } placeholder: {
                    ProgressView()
                        .frame(width: size, height: size)
                }
            } else if showDefaultCover {
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size * 0.5, height: size * 0.5)  // Make icon slightly smaller
                    .frame(width: size, height: size)  // Keep the container size consistent
                    .foregroundColor(.secondary)
            }
        }
    }
}

/// Show length of the lyrics
private func showLength(of lyrics: Lyrics) -> String {
    if let length = lyrics.length, length > 0 {
        return formatTime(length)
    }

    if let guessLength = lyrics.estimatedDuration {
        return "> \(formatTime(guessLength))"
    }

    return "Unknown"
}

/// Format time to "mm:ss", e.g. 123 -> "02:03"
private func formatTime(_ time: TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    return String(format: "%d:%02d", minutes, seconds)
}

extension Lyrics: @retroactive Identifiable {
    public var id: String { description }
}
