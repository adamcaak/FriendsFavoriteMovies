//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Łukasz Adamczak on 11/07/2025.
//

import SwiftUI

struct FriendDetail: View {
    @Bindable var friend: Friend
    
    var body: some View {
        Form {
            TextField("Name:", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
}
