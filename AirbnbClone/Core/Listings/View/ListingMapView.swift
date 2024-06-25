//
//  ListingMapView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-30.
//

import SwiftUI
import MapKit

struct ListingMapView: View {
    
    private var listings: [Listing]
    @State private var cameraPosition: MapCameraPosition
    @State private var selectedListing: Listing?
    @State private var showDetails = false
    @Environment(\.dismiss) var dismiss
    
    
    init(listings: [Listing], center: CLLocationCoordinate2D = .miami) {
        self.listings = listings
        
        let coordinateRegion = MKCoordinateRegion(center: center, latitudinalMeters: 50000, longitudinalMeters: 50000)
        
        self._cameraPosition = State(initialValue: .region(coordinateRegion))
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottom){
                Map(position: $cameraPosition, selection: $selectedListing) {
                    ForEach(listings, id: \.self) { listing in
                        Marker("", coordinate: listing.coordinates)
                            .tag(listing.id)
                    }
                }
                
                if let selectedListing {
                    withAnimation(.spring) {
                        ListingMapPreviewView(listing: selectedListing)
                            .onTapGesture { showDetails.toggle() }
                    }
                }
            }
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                            .shadow(radius: 4)
                    )
                    .padding(.top, 40)
                    .padding(.leading, 32)
            }

        }
        .fullScreenCover(isPresented: $showDetails, content: {
            if let selectedListing = selectedListing {
                ListingDetailView(listning: selectedListing)
            }
        })
    }
}

#Preview {
    ListingMapView(listings: DeveloperPreview.shared.listings)
}
