import XCTest
@testable import LyricsService

let testSong = "好久不见"
let testArtist = "周杰伦"
let duration = 305.0
let searchReq = LyricsSearchRequest(searchTerm: .info(title: testSong, artist: testArtist), duration: duration)

final class LyricsKitTests: XCTestCase {
    
    func _test(provider: LyricsProvider) {
        var searchResultEx: XCTestExpectation? = expectation(description: "Search result: \(provider)")
        let token = provider.lyricsPublisher(request: searchReq).sink { lrc in
            print(lrc)
            searchResultEx?.fulfill()
            searchResultEx = nil
        }
        waitForExpectations(timeout: 10)
        token.cancel()
    }
    
    func testManager() {
        _test(provider: LyricsProviders.QQMusic())
    }
    
}
