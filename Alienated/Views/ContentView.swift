//
//  ContentView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    static let subreddit = "all"
    
    @StateObject var api: ListingService = ListingService(subreddit: subreddit)
    
    var body: some View {
        NavigationView {
            ListingView(api: api)
                .navigationTitle(Self.subreddit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
