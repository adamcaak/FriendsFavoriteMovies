//
//  FilteredMoviesList.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 15/07/2025.
//

import SwiftUI

struct FilteredMoviesList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            MoviesList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FilteredMoviesList()
}
