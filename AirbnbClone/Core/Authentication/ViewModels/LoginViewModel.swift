//
//  LoginViewModel.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-30.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    private let authManager: AuthManager
    var errorMessage: String?
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authManager.login(withEmail: email, password: password)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
