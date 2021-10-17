//
//  PostsView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListingView: View {
    
    @ObservedObject var listingService: ListingService
    @ObservedObject var commentsService: CommentsService
    
    var body: some View {
        List {
            ForEach(listingService.listing, id: \.self) { link in
                NavigationLink(destination: PostView(api: commentsService, link: link)) {
                    LinkView(link: link)
                }
            }
            VStack {
                ActivityIndicator(.constant(true))
                Text("Loading...")
            }
            .padding()
            .onAppear {
                listingService.fetchPosts()
            }
            .frame(maxWidth: .infinity)
        }.refreshable {
            listingService.fetchPosts()
        }
        .listStyle(.plain)
    }
    
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView(listingService: ListingService(subreddit: "all"), commentsService: CommentsService())
    }
}
