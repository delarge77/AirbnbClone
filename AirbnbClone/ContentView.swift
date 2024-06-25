//
//  ContentView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(1 ... 10, id: \.self) { listings in
//                        Rectangle()
//                            .frame(height:400)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                        ListingItemView()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
