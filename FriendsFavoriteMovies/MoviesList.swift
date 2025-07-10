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
        List {
            ForEach(movies) { movie in
                Text(movie.title)
            }
        }
    }
}

#Preview {
    MoviesList()
        .modelContainer(SampleData.shared.modelContainer)
}
