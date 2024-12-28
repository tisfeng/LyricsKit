//
//  ContentView.swift
//  LyricsKitDemo
//
//  Created by tisfeng on 2024/11/22.
//

import LyricsService
import SwiftUI

let searchText = "一生不变 李克勤"

struct ContentView: View {
    @StateObject private var searchState = SearchState(searchText: searchText)

    var body: some View {
        LyricsSearchView(searchState: searchState)
    }
}

struct ContentView2: View {
    @StateObject private var searchState = SearchState(searchText: searchText)

    var body: some View {
        LyricsSearchView(searchState: searchState) { lyrics in
            print(lyrics)
        }
        .task {
           try? await Task.sleep(nanoseconds: 5_000_000_000)

            searchState.searchText = "壁上观 张曦匀"
            await searchState.performSearch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
