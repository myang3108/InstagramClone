//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/11/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username  })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //header
                ProfileHeaderView(user: user)
                //post grid view
                
                
                PostGridView(posts: posts)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.Mock_Users[1])
}
