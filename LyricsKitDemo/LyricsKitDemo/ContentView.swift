//
//  ContentView.swift
//  LyricsKitDemo
//
//  Created by tisfeng on 2024/11/22.
//

import LyricsService
import SwiftUI

struct ContentView: View {
    @State private var searchText = "一生不变 李克勤"

    var body: some View {
        LyricsSearchView(searchText: searchText)
    }
}

#Preview {
    ContentView()
}
