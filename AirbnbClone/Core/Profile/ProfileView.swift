//
//  ProfileView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import SwiftUI

struct ProfileView: View {
    
    @State var showLogIn = false
    @ObservedObject var authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    var body: some View {
        
        // Profile login view
        VStack {
            if authManager.userSessionId == nil {
                ProfileLoginView(showLogIn: $showLogIn)
            } else {
                UserProfileHeaderView()
            }
            
            // Profile options
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
            
            if authManager.userSessionId != nil {
                Button(action: {
                    authManager.signOut()
                }, label: {
                    Text("Log out")
                        .foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .underline()
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .sheet(isPresented: $showLogIn, content: {
            LoginView(authManager: authManager)
        })
        .padding()
        
    }
}

#Preview {
    ProfileView(authManager: AuthManager(service: MockAuthService()))
}
