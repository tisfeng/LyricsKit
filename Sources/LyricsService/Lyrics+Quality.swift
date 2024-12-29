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
private let titleWeight = 0.2  // Weight for title match
private let artistWeight = 0.2  // Weight for artist match
private let durationWeight = 0.2  // Weight for duration match
private let timetagWeight = 0.2  // Weight for time tag presence
private let translationWeight = 0.1  // Weight for translation presence
private let albumWeight = 0.1  // Weight for album match

// Quality adjustment factors (0.0 ~ 1.0)
private let matchedArtistFactor = 1.0  // Perfect artist match
private let noArtistFactor = 0.3  // No artist information available

private let matchedTitleFactor = 1.0  // Perfect title match
private let noTitleFactor = 0.2  // No title information available

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

        if let album = idTags[.album] {
            quality += albumWeight
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
        guard let service = metadata.service else { return 0 }
        
        // QQ music does not provide duration, but it's still a good match
        if service == .qq { return 1.0 }
        
        let searchDuration = metadata.searchRequest?.duration ?? 0
        let targetDuration = searchDuration > 0 ? searchDuration : 240  // 4 minutes default
        
        return (length ?? 0).durationQuality(to: targetDuration)
    }
}

extension Double {
    /// Calculate the quality score based on the difference ratio between two durations.
    /// Returns a value between 0 and 1, where:
    /// - 1.0 means perfect match
    /// - 0.0 means the difference equals or exceeds the target duration
    /// 
    /// For example, if target duration is 240s:
    /// - difference 10s → score 0.96
    /// - difference 30s → score 0.88
    /// - difference 60s → score 0.75
    /// - difference 120s → score 0.50
    ///
    /// - Parameters:
    ///   - targetDuration: The target duration to compare with
    /// - Returns: A quality score between 0 and 1
    public func durationQuality(to targetDuration: Double) -> Double {
        let difference = abs(self - targetDuration)
        return Swift.max(0, 1 - (difference / targetDuration))
    }
}
