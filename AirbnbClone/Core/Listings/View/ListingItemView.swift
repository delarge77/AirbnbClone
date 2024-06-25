//
//  ListingView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-24.
//

import Foundation
import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            
            ListingImageCarouselView(images: listing.imagesURLs)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack(alignment: .top){

                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state))")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(Color(.gray))
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(Color(.gray))
                    
                    HStack(spacing: 4){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.black)
                    Text("\(listing.rating)")
                        .foregroundStyle(.black)
                }
            }
            .font(.footnote)
                
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
