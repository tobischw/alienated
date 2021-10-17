//
//  ContentView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    static let subreddit = "all"
    
    @StateObject var listingService: ListingService = ListingService(subreddit: subreddit)
    @StateObject var commentsService: CommentsService = CommentsService()
    
    var body: some View {
        NavigationView {
            ListingView(listingService: listingService, commentsService: commentsService)
                .navigationTitle(Self.subreddit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
