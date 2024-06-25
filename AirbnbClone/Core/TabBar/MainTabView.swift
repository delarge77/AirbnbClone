//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import SwiftUI

struct MainTabView: View {
    
    private let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label ("Explore", systemImage: "magnifyingglass") }
            
            WishlistsView(authManager: authManager)
                .tabItem { Label ("Wishlists", systemImage: "heart") }
            
            ProfileView(authManager: authManager)
                .tabItem { Label ("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView(authManager: AuthManager(service: MockAuthService()))
}
