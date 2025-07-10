//
//  MoviesList.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 10/07/2025.
//

import SwiftUI
import SwiftData

struct MoviesList: View {
    @Query(sort: \Movies.title) private var movies: [Movies]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        Text("Detail view for \(movie.title)")
                            .navigationTitle("Movie")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Movies")
        } detail: {
             Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MoviesList()
        .modelContainer(SampleData.shared.modelContainer)
}
