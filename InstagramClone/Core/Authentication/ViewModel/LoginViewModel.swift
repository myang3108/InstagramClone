//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/17/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    
    func signIn() async throws {
       try await AuthService.shared.login(withEmail: email, password: password)
    }
    
    
}
