//
//  ListingMapPreviewView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-30.
//

import SwiftUI

struct ListingMapPreviewView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack {
            TabView {
                ForEach(listing.imagesURLs, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Rectangle())
                }
            }
            .frame(height: 200)
            .tabViewStyle(.page)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    Text("7 nights: Dec 12 - 20")
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                
                Text("\(listing.rating)")
            }
            .font(.footnote)
            .padding(8)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    ListingMapPreviewView(listing: DeveloperPreview.shared.listings[0])
}
