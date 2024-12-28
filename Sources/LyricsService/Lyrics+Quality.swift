//
//  Lyrics+Quality.swift
//  LyricsX - https://github.com/ddddxxx/LyricsX
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation
import LyricsCore

// Weights for different factors (total = 1.0)
private let titleWeight = 0.3  // Weight for title match
private let artistWeight = 0.2  // Weight for artist match
private let durationWeight = 0.2  // Weight for duration match
private let timetagWeight = 0.2  // Weight for time tag presence
private let translationWeight = 0.1  // Weight for translation presence

// Quality adjustment factors (0.0 ~ 1.0)
private let matchedArtistFactor = 1.0  // Perfect artist match
private let noArtistFactor = 0.3  // No artist information available

private let matchedTitleFactor = 1.0  // Perfect title match
private let noTitleFactor = 0.2  // No title information available

private let noDurationFactor = 0.5  // No duration information available, like QQ music.
private let minimalDurationQuality = 0.1  // Minimum acceptable duration quality

extension Lyrics {

    /// Calculates the quality of the lyrics based on various factors.
    /// The quality is a value between 0 and 1, where:
    ///   - 1 means perfect match (all factors match)
    ///   - 0 means no match (all factors do not match)
    ///   - Values in between represent partial matches
    public var quality: Double {
        if let quality = metadata.quality {
            return quality
        }

        // Calculate base quality from main factors
        var quality = artistQuality * artistWeight + titleQuality * titleWeight + durationQuality * durationWeight

        // Add translation and timetag weights
        quality += (metadata.hasTranslation ? 1.0 : 0.0) * translationWeight
        quality += (metadata.attachmentTags.contains(.timetag) ? 1.0 : 0.0) * timetagWeight

        // Ensure quality is between 0 and 1
        quality = Swift.max(0, Swift.min(1, quality))

        metadata.quality = quality

        return quality
    }

    /// Checks if the lyrics match the search request.
    /// A match is considered when both artist and title match.
    public func isMatched() -> Bool {
        guard let artist = idTags[.artist],
            let title = idTags[.title]
        else {
            return false
        }
        switch metadata.searchRequest?.searchTerm {
        case let .info(searchTitle, searchArtist)?:
            return title.isCaseInsensitiveSimilar(to: searchTitle)
                && artist.isCaseInsensitiveSimilar(to: searchArtist)
        case let .keyword(keyword)?:
            return title.isCaseInsensitiveSimilar(to: keyword)
                && artist.isCaseInsensitiveSimilar(to: keyword)
        case nil:
            return false
        }
    }

    /// Calculates the quality of the artist match.
    /// The quality is a value between 0 and 1.
    private var artistQuality: Double {
        guard let artist = idTags[.artist] else { return noArtistFactor }
        switch metadata.searchRequest?.searchTerm {
        case let .info(_, searchArtist)?:
            if artist == searchArtist { return matchedArtistFactor }
            return artist.similarity(to: searchArtist)
        case let .keyword(keyword)?:
            if keyword.contains(artist) { return matchedArtistFactor }
            return artist.similarity(in: keyword)
        case nil:
            return noArtistFactor
        }
    }

    /// Calculates the quality of the title match.
    /// The quality is a value between 0 and 1.
    private var titleQuality: Double {
        guard let title = idTags[.title] else { return noTitleFactor }
        switch metadata.searchRequest?.searchTerm {
        case let .info(searchTitle, _)?:
            if title == searchTitle { return matchedTitleFactor }
            return title.similarity(to: searchTitle)
        case let .keyword(keyword)?:
            if keyword.contains(title) { return matchedTitleFactor }
            return title.similarity(in: keyword)
        case nil:
            return noTitleFactor
        }
    }

    /// Calculates the quality of the duration match.
    /// The quality is a value between 0 and 1.
    private var durationQuality: Double {
        var searchDuration = metadata.searchRequest?.duration ?? 0
        if searchDuration == 0 {
            searchDuration = 200  // Default duration for unknown duration
        }

        guard let duration = length else {
            return noDurationFactor
        }

        return duration.durationQuality(
            to: searchDuration,
            maxDifference: 10,
            minQuality: minimalDurationQuality
        )
    }
}

extension Double {
    /// Calculate the quality score based on the difference between two durations.
    /// - Parameters:
    ///   - targetDuration: The target duration to compare with
    ///   - maxDifference: Maximum acceptable time difference in seconds (default: 10)
    ///   - minQuality: Minimum quality score when difference exceeds maxDifference (default: 0.1)
    /// - Returns: A quality score between [minQuality, 1.0]
    public func durationQuality(
        to targetDuration: Double,
        maxDifference: Double = 10,
        minQuality: Double = 0.1
    ) -> Double {
        let difference = abs(self - targetDuration)

        // If difference exceeds maxDifference, return minQuality
        guard difference < maxDifference else {
            return minQuality
        }

        // Calculate quality using quadratic function
        // This creates a smooth curve from 1.0 (perfect match) to minQuality
        let normalizedDiff = difference / maxDifference
        return 1 - pow(normalizedDiff, 2) * (1 - minQuality)
    }
}
