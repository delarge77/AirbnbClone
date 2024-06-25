//
//  PrimaryTextFieldModifier.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-30.
//

import SwiftUI

struct PrimaryTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
