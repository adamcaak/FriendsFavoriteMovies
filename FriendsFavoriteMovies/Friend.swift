//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 09/07/2025.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movies?
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
            Friend(name: "Tom"),
            Friend(name: "John"),
            Friend(name: "Adam"),
            Friend(name: "Bożena"),
            Friend(name: "Kasia"),
            Friend(name: "Asia"),
    ]
}
