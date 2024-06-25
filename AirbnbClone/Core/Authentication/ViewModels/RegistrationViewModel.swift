//
//  RegistrationViewModel.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-30.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    private let service: MockAuthService
    var errorMessage: String?
    
    init(service: MockAuthService) {
        self.service = service
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async {
        do {
            try await service.createUser(withEmail: email, password: password, fullName: fullName)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
