import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    public func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequstDataFromURL() {
        let clientSpy = HTTPClientSpy()
        HTTPClient.shared = clientSpy
        let sut = RemoteFeedLoader()
        
        XCTAssertNil(clientSpy.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let clientSpy = HTTPClientSpy()
        HTTPClient.shared = clientSpy
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(clientSpy.requestedURL)
         
    }
}
