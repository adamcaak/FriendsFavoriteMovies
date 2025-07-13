//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 09/07/2025.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movies: Movies {
        Movies.sampleData.first!
    }
    
    private init() {
        let schema = Schema([
            Friend.self,
            Movies.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
            
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movies.sampleData {
            context.insert(movie)
        }
        
        Friend.sampleData[0].favoriteMovie = Movies.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movies.sampleData[0]
        Friend.sampleData[3].favoriteMovie = Movies.sampleData[4]
        Friend.sampleData[4].favoriteMovie = Movies.sampleData[0]
    }
}
