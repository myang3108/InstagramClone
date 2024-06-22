//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/12/24.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    
    
    var body: some View {
        VStack {
            HStack { //action toolbar
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        caption = ""
                        viewModel.selectedImage = nil
                        viewModel.postImage = nil
                        tabIndex = 0
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
                
            }//make a header to cancel the upload or make the upload
            HStack { //post image + caption
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:100, height:100)
                        .clipped()
                }
                TextField("Enter your caption", text: $caption, axis:.vertical)
                
            }
            .padding()
            Spacer()
        }
        
        
        .onAppear {
            imagePickerPresented.toggle()
        }
        
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
