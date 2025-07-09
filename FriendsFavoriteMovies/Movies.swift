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
}
