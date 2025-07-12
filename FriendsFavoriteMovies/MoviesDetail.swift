//
//  MoviesDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 11/07/2025.
//

import SwiftUI

struct MoviesDetail: View {
    @Bindable var movies: Movies
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var contenxt
    
    var body: some View {
        Form {
            TextField("Name:", text: $movies.title)
                .autocorrectionDisabled()
            DatePicker("Release Date", selection: $movies.releaseDate)
        }
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
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

#Preview {
    NavigationStack {
        MoviesDetail(movies: SampleData.shared.movies)
    }
}
