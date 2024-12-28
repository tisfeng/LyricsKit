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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
