import Foundation

public  enum LoadFeedResult  {
    case success([FeedItem])
    case faliure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
