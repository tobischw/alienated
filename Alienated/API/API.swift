//
//  API.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/16/21.
//

import Foundation

struct API {
    static let shared = API()
    
    func fetchThing(url: URL, completion: @escaping (Thing)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            if let thing = try? JSONDecoder().decode(Thing.self, from: data) {
                print(thing)
                completion(thing)
            }
        }.resume()
    }
}
