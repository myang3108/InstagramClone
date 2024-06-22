//
//  AuthService.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/17/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User? //determine if we have user logged in or not
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task {try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        }
        catch {
            print("Login Fail: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("debug: did create new user")
            self.userSession = result.user
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
            print("debug: did uplaoad user data")
        }
        catch {
            print("Create user Fail: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {return}
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    
    private func uploadUserData(uid: String, username: String, email: String) async { //helper function for uploading data
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        
    }
    
}
