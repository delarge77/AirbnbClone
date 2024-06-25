//
//  MockAuthService.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-03.
//

import Foundation

struct MockAuthService: AuthServiceProtocol {
    
    func login(withEmail email: String, password: String) async throws -> String? {
        return UUID().uuidString
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws -> String? {
        return UUID().uuidString
    }
    
    func signOut() {}
}
