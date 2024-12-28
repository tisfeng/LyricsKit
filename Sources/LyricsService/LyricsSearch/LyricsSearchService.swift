//
//  LyricsApp.swift
//  LyricsXCore
//
//  Created by tisfeng on 2024/11/26.
//

import Combine
import Foundation

public class LyricsSearchService {
    private var provider: LyricsProviders.Group
    private var searchCanceller: AnyCancellable?

    public init(providers: [LyricsProviders.Service] = [.qq, .netease, .kugou]) {
        self.provider = .init(service: providers)
    }

    /// Search lyrics with text
    /// - Parameters:
    ///   - keyword: Search text
    public func searchLyrics(keyword: String) async throws -> [Lyrics] {
        if keyword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return []
        }

        let searchReq = LyricsSearchRequest(
            searchTerm: .keyword(keyword),
            duration: 0
        )

        return try await withCheckedThrowingContinuation { continuation in
            var results: [Lyrics] = []

            searchCanceller = provider.lyricsPublisher(request: searchReq)
                .timeout(.seconds(10), scheduler: DispatchQueue.lyricsQueue)
                .receive(on: DispatchQueue.lyricsQueue)
                .sink(
                    receiveCompletion: { completionStatus in
                        switch completionStatus {
                        case .finished:
                            continuation.resume(returning: results)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    },
                    receiveValue: { lyrics in
                        results.append(lyrics)
                    }
                )
        }
    }

    /// Cancel ongoing search
    public func cancelSearch() {
        searchCanceller?.cancel()
    }
}

extension DispatchQueue {
    static let lyricsQueue = DispatchQueue(label: "lyricsQueue")
}
