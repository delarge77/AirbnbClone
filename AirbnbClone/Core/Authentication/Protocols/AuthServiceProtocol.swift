//
//  AuthServiceProtocol.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-03.
//

import Foundation

protocol AuthServiceProtocol {
    
    func login(withEmail email: String, password: String) async throws -> String?
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws -> String?
    
    func signOut()
}
