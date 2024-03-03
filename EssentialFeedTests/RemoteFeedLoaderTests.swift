import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequstDataFromURL() {
        let sut = RemoteFeedLoader()
        let client = HTTPClient()
        
        
        XCTAssertNil(client.requestedURL)
    }
}
