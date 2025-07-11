//
//  MoviesDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 11/07/2025.
//

import SwiftUI

struct MoviesDetail: View {
    @Bindable var movies: Movies
    
    var body: some View {
        Form {
            TextField("Name:", text: $movies.title)
                .autocorrectionDisabled()
        }
    }
}

#Preview {
    MoviesDetail(movies: SampleData.shared.movies)
}
