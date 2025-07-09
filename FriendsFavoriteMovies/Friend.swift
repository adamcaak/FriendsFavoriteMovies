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
    
    init(name: String) {
        self.name = name
    }
}
