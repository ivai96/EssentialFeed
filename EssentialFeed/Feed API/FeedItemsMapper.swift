import Foundation

internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [FeedItemDTO]
        var feed: [FeedItem] {
            items.map{ $0.item }
        }
    }
    
    private struct FeedItemDTO: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(
                id: id,
                description: description,
                location: location,
                imageURL: image)
        }
    }
    
    private static var OK_200: Int { 200 }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)
        else {
            return .faliure(.invalidData)
        }
         
        return .success(root.feed)
    }
}
