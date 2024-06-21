//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/12/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    @State private var showEditProfile = false
    
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                HStack(spacing: 8) {
                    StatView(value: 3, title: "Posts")
                    StatView(value: 5, title: "Followers")
                    StatView(value: 10, title: "Following")
                }
            }
            .padding(.horizontal)

            
            //name and bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text(user.username)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            //action button
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }
                else {
                    print("Follow user...")
                }
                
            } label : {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius:6).stroke(user.isCurrentUser ? Color.gray: .clear, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            Text("Edit profile view")
        }

    }
}

#Preview {
    ProfileHeaderView(user: User.Mock_Users[1])
}
