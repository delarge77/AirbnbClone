//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var listenings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListenings() }
    }
    
    @MainActor
    func fetchListenings() async {
        do {
            self.listenings = try await service.fetchListenings()
            self.listingsCopy = listenings
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let filteringListings = listenings.filter ({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listenings = filteringListings.isEmpty ? self.listingsCopy : filteringListings
    }
}
