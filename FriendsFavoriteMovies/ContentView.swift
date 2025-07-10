//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 08/07/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "person.and.person") {
                FriendList()
            }
            Tab("Movies", systemImage: "film.stack") {
                MoviesList()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
