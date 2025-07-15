//
//  MoviesDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 11/07/2025.
//

import SwiftUI

struct MoviesDetail: View {
    @Bindable var movies: Movies
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var contenxt
    
    init(movies: Movies, isNew: Bool = false) {
        self.movies = movies
        self.isNew = isNew
    }
    
    var sortedFriends: [Friend] {
        movies.favoriteBy.sorted { first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form {
            TextField("Name:", text: $movies.title)
                .autocorrectionDisabled()
            DatePicker("Release Date", selection: $movies.releaseDate)
            
            if !movies.favoriteBy.isEmpty {
                Section("Favorite By") {
                    ForEach(sortedFriends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        contenxt.delete(movies)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MoviesDetail(movies: SampleData.shared.movies)
    }
}

#Preview("New Movie") {
    NavigationStack {
        MoviesDetail(movies: SampleData.shared.movies, isNew: true)
    }
}
