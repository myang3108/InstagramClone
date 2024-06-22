//
//  PostService.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/22/24.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    
    static func fetchFeedPosts() async throws -> [Post] { //grab posts of all users
        let snapshot =  try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({document in
            let post = try document.data(as: Post.self)
            return post
        })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] { //grab posts of a particular user
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
    }
    
}
