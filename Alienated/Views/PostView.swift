//
//  CommentsView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    //todo: dont do it like this
    @ObservedObject var api: CommentsService
    var link: Link
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(link.title)
                .padding()
                .font(.headline)
            WebImage(url: URL(string: link.url!)!)
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
            List {
                CommentView()
            }.frame(maxWidth: .infinity)
            .listStyle(.plain)
            .onAppear {
                api.fetchComments(link: link)
            }
        }
    }
}

struct CommentView: View {
    var body: some View {
        VStack {
            Text("xentropian").bold()
            Text("This is a comment right here")
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(api: CommentsService(),
                 link: Link(id: "", subreddit: "", title: "", url: "", score: 0, thumbnail: ""))
    }
}
