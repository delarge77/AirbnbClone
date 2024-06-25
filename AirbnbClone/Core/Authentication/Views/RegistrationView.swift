//
//  RegistrationView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-30.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email =  ""
    @State private var password = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RegistrationViewModel(service: MockAuthService())
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.airbnb)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your e-mail", text: $email)
                    .modifier(PrimaryTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(PrimaryTextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(PrimaryTextFieldModifier())
            }
            
            Button(action: {
                Task { await viewModel.createUser(
                    withEmail: email,
                    password: password,
                    fullName: fullname)
                }
            }, label: {
                Text("Create Account")
                    .modifier(PrimaryButtonModifier())
            })
            .padding(.vertical)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.7)
            
            Spacer()
            
            Divider()
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 2) {
                    Text("Already have an account?")
                    
                    Text("Log in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            })
            .padding(.vertical)
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5 &&
        !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
