//
//  Models.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import Foundation

enum Kind: String, Decodable {
    case comment = "t1"
    case listing = "Listing"
    case link = "t3"
}

struct Thing: Decodable, Identifiable {
    var id: String?
    var kind: Kind
    var data: Data?
}

enum Data: Decodable {
    case listing(Listing)
    case link(Link)
    case comment(Comment)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let thing = try? container.decode(Listing.self) {
            self = .listing(thing)
            return
        }
        if let thing = try? container.decode(Link.self) {
            self = .link(thing)
            return
        }
        if let thing = try? container.decode(Comment.self) {
            self = .comment(thing)
            return
        }
        throw DecodingError.typeMismatch(Data.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Data"))
    }
}

struct Listing: Decodable {
    var after: String?
    var children: [Thing]
}

struct Link: Decodable, Hashable {
    var subreddit: String
    var title: String
    var url: String?
    var score: Int
    var thumbnail: String?
}

struct Comment: Decodable {
    var author: String
    var body: String
    var replies: Listing
}
