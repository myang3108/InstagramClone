//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Michael Yang on 5/19/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User //force pass user in
    
    var body: some View {
        //NavigationStack {
            ScrollView {
                //header
                ProfileHeaderView(user: user)
                //post grid view
                
                
             PostGridView(user: user)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)

        //}
    }
}

#Preview {
    ProfileView(user: User.Mock_Users[0])
}
