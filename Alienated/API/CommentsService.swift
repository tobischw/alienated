//
//  CommentsService.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/16/21.
//

import Foundation

class CommentsService: ObservableObject {
    @Published var comments = [Comment]()
    
    func fetchComments(link: Link) {
        let url = URL(string: "https://www.reddit.com/r/\(link.subreddit)/comments/\(link.id).json")!
        
        API.shared.fetchThing(url: url) { thing in
            guard let data = thing.data else { return }
            if case .listing(let listing) = data {
                let commentListing = listing.children[1]
                print(commentListing)
            }
        }
    }
}
