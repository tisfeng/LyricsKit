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
    @ObservedObject private var searchState: SearchState
    private let onLyricsSelected: ((Lyrics) -> Void)?

    public init(
        searchState: SearchState,
        onLyricsSelected: ((Lyrics) -> Void)? = nil
    ) {
        self.searchState = searchState
        self.onLyricsSelected = onLyricsSelected
    }

    public var body: some View {
        VStack {
            TextField("Search...", text: $searchState.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    Task {
                        await searchState.performSearch()
                    }
                }

            if searchState.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                LyricsResultView(searchResults: searchState.lyricsList, onLyricsSelected: onLyricsSelected)
            }

            if let error = searchState.error {
                Text("Search failed: \(error.localizedDescription)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .frame(minWidth: 1000, minHeight: 600)
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
                TableColumn("Quality") { lyrics in
                    Text(String(format: "%.2f", lyrics.quality))
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
                    Text(lyrics.formattedDuration)
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

    private let iconScale = 0.5

    var body: some View {
        LazyVStack(alignment: .leading) {
            Group {
                if let coverURL = coverURL {
                    AsyncImage(url: coverURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .scaleEffect(iconScale)
                    }
                } else if showDefaultCover {
                    Image(systemName: "music.note")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(iconScale)
                }
            }
            .frame(width: size, height: size)  // Apply common frame to all content
        }
    }
}

extension Lyrics {
    /// Get formatted duration string of the lyrics, e.g. "02:03"
    /// If lyrics has length property, use it directly
    /// If not, try to use estimated duration
    var formattedDuration: String {
        if let length = length, length > 0 {
            return length.formattedTime
        }

        if let guessLength = estimatedDuration {
            return "> \(guessLength.formattedTime)"
        }

        return "Unknown"
    }
}

extension TimeInterval {
    /// Format time to "mm:ss", e.g. 123 -> "02:03"
    public var formattedTime: String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

extension Lyrics: @retroactive Identifiable {
    public var id: String { description }
}
