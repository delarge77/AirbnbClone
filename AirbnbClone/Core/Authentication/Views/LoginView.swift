//
//  LoginView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-30.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email =  ""
    @State private var password = ""
    private let authManager: AuthManager
    @StateObject var viewModel: LoginViewModel
    @Environment(\.dismiss) var dismiss
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authManager: authManager))
    }
    
    var body: some View {
        NavigationStack {
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
                }
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Button(action: {
                    Task {
                        await viewModel.login(
                            withEmail: email,
                            password: password)
                        dismiss()
                    }
                }, label: {
                    Text("Login")
                        .modifier(PrimaryButtonModifier())
                })
                .padding(.vertical)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty
    }
    
    
}

#Preview {
    LoginView(authManager: AuthManager(service: MockAuthService()))
}
