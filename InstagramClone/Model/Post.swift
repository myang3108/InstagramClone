//
//  Post.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/12/24.
//

import Foundation
import Firebase
struct Post: Identifiable, Hashable, Codable { //identifiable: list, Hashable: navigation, codable: server
    let id: String //needed for identifiable
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "test1", likes: 1, imageUrl: "me", timestamp: Timestamp(), user: User.Mock_Users[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "test2", likes: 2, imageUrl: "me", timestamp: Timestamp(), user: User.Mock_Users[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "test3", likes: 2, imageUrl: "me", timestamp: Timestamp(), user: User.Mock_Users[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "test4", likes: 4, imageUrl: "me", timestamp: Timestamp(), user: User.Mock_Users[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "test5", likes: 5, imageUrl: "me", timestamp: Timestamp(), user: User.Mock_Users[1]),
    ]
}
