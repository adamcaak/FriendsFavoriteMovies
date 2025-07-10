//
//  Movies.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 09/07/2025.
//

import Foundation
import SwiftData

@Model
class Movies {
    var title: String
    var releaseDate: Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movies(title: "The Shawshank Redemption", releaseDate: Date()),
        Movies(title: "The Godfather", releaseDate: Date()),
        Movies(title: "The Godfather: Part II", releaseDate: Date()),
        Movies(title: "The Dark Knight", releaseDate: Date()),
        Movies(title: "12 Angry Men", releaseDate: Date()),
        Movies(title: "Schindler's List", releaseDate: Date()),
        Movies(title: "Pulp Fiction", releaseDate: Date()),
        Movies(title: "The Good, the Bad and the Ugly", releaseDate: Date()),
        Movies(title: "The Lord of the Rings: The Return of the King", releaseDate: Date()),
        Movies(title: "The Matrix", releaseDate: Date()),
    ]
}
