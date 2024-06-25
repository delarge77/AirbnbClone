//
//  AuthManager.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-03.
//

import Foundation

class AuthManager: ObservableObject {
    @Published var userSessionId: String?
    
    private let service: AuthServiceProtocol
    
    init(service: AuthServiceProtocol) {
        self.service = service
//        userSessionId = "1234"
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        self.userSessionId = try await service.login(withEmail: email, password: password)
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        self.userSessionId = try await service.createUser(withEmail: email, password: password, fullName: fullName)
    }
    
    @MainActor
    func signOut()  {
        service.signOut()
        self.userSessionId = nil
    }
}
