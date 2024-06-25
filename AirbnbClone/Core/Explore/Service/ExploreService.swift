//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import Foundation

class ExploreService {
    func fetchListenings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
