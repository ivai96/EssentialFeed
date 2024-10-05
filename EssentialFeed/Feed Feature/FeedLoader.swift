import Foundation

public  enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case faliure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
