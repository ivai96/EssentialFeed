import XCTest

class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
       client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequstDataFromURL() {
        let url = URL(string: "https://a-url.com")!
        let clientSpy = HTTPClientSpy()
        
        _ = RemoteFeedLoader(url: url, client: clientSpy)
        
        XCTAssertNil(clientSpy.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let clientSpy = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: clientSpy)
        
        sut.load()
        
        XCTAssertEqual(clientSpy.requestedURL, url)
         
    }
}
