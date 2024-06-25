//
//  ListingImageCarouselView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let images: [String]
    
    var body: some View {
        TabView{
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(images: DeveloperPreview.shared.listings[0].imagesURLs)
}
