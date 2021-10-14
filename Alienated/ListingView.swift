//
//  PostsView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI

struct ListingView: View {
    
    @ObservedObject var api: API
    
    var body: some View {
        List {
            ForEach(api.listing, id: \.self) { link in
                LinkView(link: link)
            }
        }
        .listStyle(.plain)
        .onAppear {
            api.fetchPosts() {
            }
        }
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView(api: API())
    }
}
