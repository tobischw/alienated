//
//  API.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import Foundation
import SwiftUI

class ListingService: ObservableObject {
    @Published var listing = [Link]()
    @Published var isLoading = false
    
    @Published var lastThing: String?
    
    var subreddit: String
    
    init(subreddit: String) {
        self.subreddit = subreddit
    }
    
    func fetchPosts() {
        isLoading = true
        let url = URL(string: "https://www.reddit.com/r/\(subreddit).json\(lastThing != nil ? "?after=\(lastThing!)" : "")")!
        
        API.shared.fetchThing(url: url) { thing in
            guard let data = thing.data else { return }
            if case .listing(let listing) = data {
                let newListings: [Link] = listing.children.compactMap {
                    guard case .link(let link) = $0.data else { return nil }
                    return link
                }
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.listing.append(contentsOf: newListings)
                    self.lastThing = listing.after
                }
            }
        }
    }
}
