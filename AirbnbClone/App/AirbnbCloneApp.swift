//
//  AirbnbCloneApp.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-23.
//

import SwiftUI

@main
struct AirbnbCloneApp: App {
    
    let authManager = AuthManager(service: FirebaseAuthService())
    
    var body: some Scene {
        WindowGroup {
            MainTabView(authManager: authManager)
        }
    }
}
