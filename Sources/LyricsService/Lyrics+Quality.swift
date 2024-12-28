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

private let translationBonus = 0.1
private let inlineTimeTagBonus = 0.1
private let matchedArtistFactor = 1.3
private let matchedTitleFactor = 1.5
private let noArtistFactor = 0.8
private let noTitleFactor = 0.8
private let noDurationFactor = 0.8
private let minimalDurationQuality = 0.5
private let qualityMixBound = 1.05

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

        // Calculate the product first
        let product = (qualityMixBound - artistQuality) * (qualityMixBound - titleQuality) * (qualityMixBound - durationQuality)

        // Handle negative or zero cases
        var quality: Double
        if product <= 0 {
            quality = 0
        } else {
            // Calculate cube root using cbrt function
            quality = 1 - cbrt(product)
        }

        // Add bonus points
        if metadata.hasTranslation {
            quality += translationBonus
        }
        if metadata.attachmentTags.contains(.timetag) {
            quality += inlineTimeTagBonus
        }

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
    /// The quality is a value between 0 and 1, where:
    ///   - 1 means perfect match (artist matches exactly)
    ///   - 0 means no match (artist does not match at all)
    ///   - Values in between represent partial matches
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
    /// The quality is a value between 0 and 1, where:
    ///   - 1 means perfect match (title matches exactly)
    ///   - 0 means no match (title does not match at all)
    ///   - Values in between represent partial matches
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
    /// The quality is a value between 0 and 1, where:
    ///   - 1 means perfect match (duration matches exactly)
    ///   - 0 means no match (duration does not match at all)
    ///   - Values in between represent partial matches
    private var durationQuality: Double {
        guard let duration = length,
              let searchDuration = metadata.searchRequest?.duration
        else {
            return noDurationFactor
        }
        let dt = abs(searchDuration - duration)
        guard dt < 10 else {
            return minimalDurationQuality
        }
        return 1 - pow(1 - (dt / 10), 2) * (1 - minimalDurationQuality)
    }
}
