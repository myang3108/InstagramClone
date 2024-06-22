//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/16/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    //published propertieis notify our view that somehting changes
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async { //gets data from selected image and uses uiimage to create the actual image
        guard let item = item else { return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return} //loading data from native photopicker
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        
        
        try await postRef.setData(encodedPost) // post to firebase
    }
}

