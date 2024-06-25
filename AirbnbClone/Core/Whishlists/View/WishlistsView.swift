//
//  WishlistsView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import SwiftUI

struct WishlistsView: View {
    
    @State var showLogIn = false
    @ObservedObject var authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if authManager.userSessionId == nil {
                    WishlistLoginView(showLogIn: $showLogIn)
                } else {
                    WishlistEmptyStateView()
                }
            }
            .padding()
            .sheet(isPresented: $showLogIn, content: {
                LoginView(authManager: authManager)
            })
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistsView(authManager: AuthManager(service: MockAuthService()))
}
