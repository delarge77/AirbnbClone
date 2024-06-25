//
//  ProfileLoginView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-03.
//

import SwiftUI

struct ProfileLoginView: View {
    
    @Binding var showLogIn: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Log in to start planning your next trip")
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            
            Button(action: {
                showLogIn.toggle()
            }, label: {
                Text("Log In")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 48)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            })
            
            HStack {
                Text("Don't have an account?")
                
                Text("Sign up")
                    .fontWeight(.semibold)
                    .underline()
            }
        }
    }
}

#Preview {
    ProfileLoginView(showLogIn: .constant(false))
}
