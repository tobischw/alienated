//
//  CommentsView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI

struct PostView: View {
    var link: Link
    
    var body: some View {
        VStack {
            Text(link.title)
            List {
                CommentView()
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
        PostView(link: Link(subreddit: "", title: "", url: "", score: 0, thumbnail: ""))
    }
}
