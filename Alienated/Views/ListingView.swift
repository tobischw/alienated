//
//  PostsView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListingView: View {
    
    @ObservedObject var api: ListingService
    
    var body: some View {
        List {
            ForEach(api.listing, id: \.self) { link in
                LinkView(link: link)
                
            }
            VStack {
                ActivityIndicator(.constant(true))
                Text("Loading...")
            }
            .padding()
            .onAppear {
                api.fetchPosts()
            }
            .frame(maxWidth: .infinity)
        }.refreshable {
                api.fetchPosts()
            }
        .listStyle(.plain)
    }
    
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView(api: ListingService(subreddit: "all"))
    }
}
