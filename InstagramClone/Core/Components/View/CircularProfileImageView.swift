//
//  CircularProfileImageView.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/21/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case.xSmall:
            return 40
        case.small:
            return 48
        case.medium:
            return 64
        case .large:
            return 80
        }
    }
    
}
    
    struct CircularProfileImageView: View {
        let user: User
        let size: ProfileImageSize
        
        var body: some View {
            if let imageUrl = user.profileImageUrl {
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle())
                    .foregroundColor(Color(.systemGray4))
                
            }
        }
    }
    
    #Preview {
        CircularProfileImageView(user: User.Mock_Users[0], size: .large)
    }
