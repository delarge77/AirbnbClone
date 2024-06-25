//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-24.
//

import SwiftUI

struct ExploreView: View {
    
    @State var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    @State private var showMapView = false
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                ZStack(alignment: .bottom) {
                    ScrollView {
                        SearchAndFilterBar(location: $viewModel.searchLocation)
                            .onTapGesture {
                                withAnimation(.snappy){
                                    showDestinationSearchView.toggle()
                                }
                                
                            }
                        
                        LazyVStack(spacing: 32) {
                            ForEach(viewModel.listenings) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(listing: listing)
                                        .frame(height:400)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                    }
                    .navigationDestination(for: Listing.self) { listing in
                        ListingDetailView(listning: listing)
                            .navigationBarBackButtonHidden()
                    }
                    // Another way of doing float button
//                    .overlay(alignment: .bottom) {
//                        Button {
//
//                        } label: {
//                            HStack {
//                                Text("Map")
//
//                                Image(systemName: "paperplane")
//                            }
//                            .foregroundColor(.white)
//                            .padding(.vertical, 12)
//                            .padding(.horizontal)
//                            .background(Color.black)
//                            .clipShape(Capsule())
//                            .padding()
//                        }
//                    }
                    
                    Button {
                        showMapView.toggle()
                    } label: {
                        HStack {
                            Text("Map")
                            
                            Image(systemName: "paperplane")
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(Color.black)
                        .clipShape(Capsule())
                        .padding()
                    }
                }
                .sheet(isPresented: $showMapView, content: {
                    ListingMapView(listings: viewModel.listenings)
                })
            }
        }
    }
}

#Preview {
    ExploreView()
}
