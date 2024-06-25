//
//  UserProfileHeaderView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-06-03.
//

import SwiftUI

struct UserProfileHeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28)
                .fill(.white)
                .frame(width: 300, height: 200)
                .shadow(radius: 10)
            
            VStack(spacing: 12){
                CircularProfileImageView(size: .xLarge)
                
                VStack {
                    Text("John Doe")
                        .font(.headline)
                    Text("Guest")
                        .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    UserProfileHeaderView()
}
