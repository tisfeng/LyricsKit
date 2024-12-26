//
//  Lyrics+EstimatedDuration.swift
//  LyricsKit
//
//  Created by tisfeng on 2024/12/26.
//

import Foundation

extension Lyrics {

    /// Guess the length of the song, for the lyrics that has no length metadata, like QQMusic.
    /// - Returns: The guessed length of the song.
    /// - Note: The length is calculated by the last line's position and time tags.
    var estimatedDuration: TimeInterval? {
        guard let lastLine = lines.last else {
            return nil
        }

        var duration = lastLine.position

        if let timeTags = lastLine.attachments.timetag?.tags {
            let lastTimeTag = timeTags.last
            let lastTime = lastTimeTag?.time ?? 0
            duration += lastTime
        }

        return duration > 0 ? duration : nil
    }
}
