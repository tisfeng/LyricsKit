//
//  ContentView.swift
//  LyricsKitDemo
//
//  Created by tisfeng on 2024/11/22.
//

import SwiftUI
import LyricsService

struct ContentView: View {
    @StateObject private var searchService = LyricsSearchService(searchText: "一生不变 李克勤")

    var body: some View {
        LyricsSearchView(searchService: searchService) { lyrics in
            print(lyrics)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
