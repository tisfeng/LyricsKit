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
        let product =
        (qualityMixBound - artistQuality) * (qualityMixBound - titleQuality)
        * (qualityMixBound - durationQuality)

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
            return similarity(s1: artist, s2: searchArtist)
        case let .keyword(keyword)?:
            if keyword.contains(artist) { return matchedArtistFactor }
            return similarity(s1: artist, in: keyword)
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
            return similarity(s1: title, s2: searchTitle)
        case let .keyword(keyword)?:
            if keyword.contains(title) { return matchedTitleFactor }
            return similarity(s1: title, in: keyword)
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

extension String {
    /// Calculates the Levenshtein distance between two strings.
    /// The Levenshtein distance is the minimum number of single-character edits required to change one string into another.
    ///
    /// - Parameters:
    ///   - target: The target string to compare with
    ///   - substitutionCost: The cost of substituting a character (default: 1)
    ///   - insertionCost: The cost of inserting a character (default: 1)
    ///   - deletionCost: The cost of deleting a character (default: 1)
    /// - Returns: The minimum edit distance between the two strings
    /// - Note: Uses dynamic programming with a single array for space efficiency
    public func distance(
        to target: String,
        substitutionCost: Int = 1,
        insertionCost: Int = 1,
        deletionCost: Int = 1
    ) -> Int {
        // Initialize the distance array with increasing values (0...n)
        // This represents the cost of transforming an empty string into target
        var distanceArray = Array(0...target.count)
        
        // For each character in the source string (self)
        for sourceChar in self {
            // Store the previous diagonal value (used for substitution)
            var previousDiagonal = distanceArray[0]
            // Update first element (represents deletion from source)
            distanceArray[0] += 1
            
            // For each character in the target string
            for (targetIndex, targetChar) in target.enumerated() {
                // Store the current diagonal value before it's overwritten
                let currentDiagonal = distanceArray[targetIndex + 1]
                
                if sourceChar == targetChar {
                    // Characters match, use the previous diagonal value
                    distanceArray[targetIndex + 1] = previousDiagonal
                } else {
                    // Characters don't match, take the minimum of three operations:
                    // 1. Substitution: previousDiagonal + substitutionCost
                    // 2. Insertion: previous element + insertionCost
                    // 3. Deletion: current element + deletionCost
                    distanceArray[targetIndex + 1] = Swift.min(
                        previousDiagonal + substitutionCost,  // Substitution
                        distanceArray[targetIndex] + insertionCost,  // Insertion
                        currentDiagonal + deletionCost  // Deletion
                    )
                }
                
                // Update previousDiagonal for the next iteration
                previousDiagonal = currentDiagonal
            }
        }
        
        // The last element contains the minimum edit distance
        return distanceArray.last!
    }

    /// Checks if two strings are similar by comparing their lowercase versions.
    /// Two strings are considered similar if one contains the other.
    ///
    /// - Parameter string: The string to compare with
    /// - Returns: `true` if the strings are similar, `false` otherwise
    /// - Example:
    ///   ```swift
    ///   "Hello".isCaseInsensitiveSimilar(to: "hello")      // returns true
    ///   "Hello World".isCaseInsensitiveSimilar(to: "world") // returns true
    ///   ```
    public func isCaseInsensitiveSimilar(to string: String) -> Bool {
        let s1 = lowercased()
        let s2 = string.lowercased()
        return s1.contains(s2) || s2.contains(s1)
    }
}

/// Calculates the similarity between two strings based on their Levenshtein distance.
/// The similarity is calculated as: (min_length - min_edit_distance) / min_length
///
/// - Parameters:
///   - s1: The first string to compare
///   - s2: The second string to compare
/// - Returns: A value between 0 and 1, where:
///   - 1 means the strings are identical
///   - 0 means the strings are completely different
///   - Values in between represent partial similarity
/// - Note: Empty strings are considered to have 0 similarity with any string
/// - Example:
///   ```swift
///   similarity("hello", "helo")  // returns 0.8
///   similarity("", "hello")      // returns 0
///   ```
func similarity(s1: String, s2: String) -> Double {
    let len = Swift.min(s1.count, s2.count)
    guard len > 0 else {
        // empty string is not considered similar to another string, even an empty string.
        return 0
    }
    let diff = Swift.min(s1.distance(to: s2, insertionCost: 0), s1.distance(to: s2, deletionCost: 0))
    return Double(len - diff) / Double(len)
}

/// Calculates how well the first string matches within the second string.
/// This is particularly useful for finding partial matches, like when one string is a substring of another.
///
/// - Parameters:
///   - s1: The string to find
///   - s2: The string to search within
/// - Returns: A value between 0 and 1, where:
///   - 1 means perfect match (s1 is identical to or completely contained within s2)
///   - 0 means no match
///   - Values in between represent partial matches
/// - Note: If both strings are empty, returns 1
/// - Example:
///   ```swift
///   similarity("hello", in: "hello world") // returns high similarity
///   similarity("helo", in: "hello world")  // returns moderate similarity
///   ```
func similarity(s1: String, in s2: String) -> Double {
    let len = Swift.max(s1.count, s2.count)
    guard len > 0 else { return 1 }
    let diff = s1.distance(to: s2, insertionCost: 0)
    return Double(len - diff) / Double(len)
}
