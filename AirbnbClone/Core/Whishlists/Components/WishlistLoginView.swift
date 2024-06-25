//
//  WishlistLoginView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-03.
//

import SwiftUI

struct WishlistLoginView: View {
    
    @Binding var showLogIn: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Log in to view your wishlists")
                    .font(.headline)
                
                Text("You can create, view or edit wishlists once you've logged in")
                    .font(.footnote)
                
            }
            
            Button(action: {
                showLogIn.toggle()
                dismiss()
            }, label: {
                Text("Log In")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 48)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            })
            
            Spacer()
        }
    }
}

#Preview {
    WishlistLoginView(showLogIn: .constant(false))
}
