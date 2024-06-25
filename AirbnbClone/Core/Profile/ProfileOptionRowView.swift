//
//  ProfileOptionRowView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import SwiftUI

struct ProfileOptionRowView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: imageName)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        
        Divider()
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
