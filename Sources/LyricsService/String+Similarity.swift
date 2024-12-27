//
//  String+Similarity.swift
//  LyricsKit
//
//  Created by tisfeng on 2024/12/27.
//

import Foundation

extension String {
    /// Calculates the Levenshtein distance between this string and another string.
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

    /// Checks if this string is similar to another string by comparing their lowercase versions.
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

    /// Calculates the similarity between this string and another string based on their Levenshtein distance.
    /// The similarity is calculated as: (min_length - min_edit_distance) / min_length
    ///
    /// - Parameter other: The string to compare with
    /// - Returns: A value between 0 and 1, where:
    ///   - 1 means the strings are identical
    ///   - 0 means the strings are completely different
    ///   - Values in between represent partial similarity
    /// - Note: Empty strings are considered to have 0 similarity with any string
    /// - Example:
    ///   ```swift
    ///   "hello".similarity(to: "helo")  // returns 0.8
    ///   "".similarity(to: "hello")      // returns 0
    ///   ```
    public func similarity(to other: String) -> Double {
        let len = Swift.min(self.count, other.count)
        guard len > 0 else {
            // empty string is not considered similar to another string, even an empty string.
            return 0
        }
        let diff = Swift.min(
            self.distance(to: other, insertionCost: 0),
            self.distance(to: other, deletionCost: 0)
        )
        return Double(len - diff) / Double(len)
    }

    /// Calculates how well this string matches within another string.
    /// This is particularly useful for finding partial matches, like when this string is a substring of another.
    ///
    /// - Parameter container: The string to search within
    /// - Returns: A value between 0 and 1, where:
    ///   - 1 means perfect match (this string is identical to or completely contained within the container)
    ///   - 0 means no match
    ///   - Values in between represent partial matches
    /// - Note: If both strings are empty, returns 1
    /// - Example:
    ///   ```swift
    ///   "hello".similarity(in: "hello world") // returns high similarity
    ///   "helo".similarity(in: "hello world")  // returns moderate similarity
    ///   ```
    public func similarity(in container: String) -> Double {
        let len = Swift.max(self.count, container.count)
        guard len > 0 else { return 1 }
        let diff = self.distance(to: container, insertionCost: 0)
        return Double(len - diff) / Double(len)
    }
}
