//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/17/24.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""

    
    func createUser() async throws {
       try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username  = ""
        email = ""
        password = "" //rests everything when we create a new account so it doesnt hold prev. data
    }
    
    
}
