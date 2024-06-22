//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/16/24.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    //published propertieis notify our view that somehting changes
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var postImage: Image?
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async { //gets data from selected image and uses uiimage to create the actual image
        guard let item = item else { return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return} //loading data from native photopicker
        guard let uiImage = UIImage(data: data) else {return}
        self.postImage = Image(uiImage: uiImage)
    }
    
}

