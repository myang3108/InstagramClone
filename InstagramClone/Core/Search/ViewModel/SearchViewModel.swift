//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Michael Yang on 6/20/24.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    
    init() {
        Task {try await fetchAllUsers() }
    }
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
