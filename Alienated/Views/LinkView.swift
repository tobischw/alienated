//
//  PostView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct LinkView: View {
    var link: Link
    
    var body: some View {
        HStack {
            if let thumbnail = link.thumbnail,
               !thumbnail.isEmpty,
               let thumbnailURL = URL(string: thumbnail) {
                WebImage(url: thumbnailURL)
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 64)
                    .padding()
            }
            VStack(alignment: .leading) {
                Text(link.title)
                    .bold()
                Text("\(link.subreddit) * \(link.score)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }.padding(5)
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(link: Link(subreddit: "test", title: "title", url: "", score: 0, thumbnail: ""))
    }
}
