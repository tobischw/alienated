//
//  API.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import Foundation
import SwiftUI

class API: ObservableObject {
    @Published var listing = [Link]()
    
    func fetchPosts(completion: @escaping () -> ()) {
        let url = URL(string: "https://www.reddit.com/r/all.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if let thing = try? JSONDecoder().decode(Thing.self, from: data),
               let data = thing.data {
                if case .listing(let listing) = data {
                    
                    let newListings: [Link] = listing.children.compactMap {
                        guard case .link(let link) = $0.data else { return nil }
                        return link
                    }
                    
                    DispatchQueue.main.async {
                        self.listing.append(contentsOf: newListings)
                        completion()
                    }
                }
            }
        }.resume()
    }
    
}
