//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/12/24.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing:1),
        .init(.flexible(), spacing:1),
        .init(.flexible(), spacing:1)
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing:1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                     .resizable()
                     .scaledToFill()
                     .frame(width: imageDimension, height: imageDimension)
                     .clipped()
            }
        }
    }
}
struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(user: User.Mock_Users[0])
    }
    
}
