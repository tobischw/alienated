//
//  ContentView.swift
//  Alienated
//
//  Created by Tobi Schweiger on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var api: API = API()
    
    var body: some View {
        NavigationView {
            ListingView(api: api)
                .navigationTitle("all")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
