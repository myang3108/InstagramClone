//
//  User.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/10/24.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String //cannot be changed
    var username: String
    var profileImageUrl: String? //optional
    var fullname: String? //optional
    var bio: String? //optional
    let email: String //constant
    
    
    var isCurrentUser: Bool { //for the edit profile vs follow button
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
}


extension User {
    static var Mock_Users: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: nil, fullname: "batman", bio: "Hello", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "iron man", profileImageUrl: nil, fullname: "ironman", bio: "tony stark", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "superman", profileImageUrl: nil, fullname: "superman", bio: "super!", email: "superman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", profileImageUrl: nil, fullname: "venom", bio: "rawr", email: "venom@gmail.com"),
    
    ]
}
