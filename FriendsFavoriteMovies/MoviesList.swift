//
//  MoviesList.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 10/07/2025.
//

import SwiftUI
import SwiftData

struct MoviesList: View {
    @Query private var movies: [Movies]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movies?
    
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movies> { movies in
            titleFilter.isEmpty || movies.title.localizedStandardContains(titleFilter)
        }
        _movies = Query(filter: predicate, sort: \Movies.title)
    }
    
    var body: some View {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        MoviesDetail(movies: movie)
                    }
                }
                .onDelete(perform: deleteMovie(indexes:))
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add movie", systemImage: "plus", action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MoviesDetail(movies: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
    }
    
    private func addMovie() {
        let newMovie = Movies(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovie(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview("Filtered") {
    MoviesList(titleFilter: "tr")
        .modelContainer(SampleData.shared.modelContainer)
}
