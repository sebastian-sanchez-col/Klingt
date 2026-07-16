//
//  ResourceService.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import CoreLocation

protocol ResourceServiceProtocol {
    func fetchNearbyResources() async throws -> [Resource]
}

final class ResourceService: ResourceServiceProtocol {
    func fetchNearbyResources() async throws -> [Resource] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return [
            Resource(id: UUID(), name: "Clínica Legal Gratuita", category: .legal, distanceInKm: 2.3, rating: 4.6,
                     coordinate: .init(latitude: 6.2447, longitude: -75.5748), address: "Cra 43A #10-25, El Poblado"),
            Resource(id: UUID(), name: "Centro de Salud Laureles", category: .salud, distanceInKm: 1.1, rating: 4.2,
                     coordinate: .init(latitude: 6.2436, longitude: -75.5906), address: "Cl 33 #76-10, Laureles"),
            Resource(id: UUID(), name: "Comedor Comunitario Centro", category: .comida, distanceInKm: 0.8, rating: 4.4,
                     coordinate: .init(latitude: 6.2518, longitude: -75.5636), address: "Cl 50 #45-20, Centro"),
            Resource(id: UUID(), name: "Oficina de Arriendos Solidarios", category: .vivienda, distanceInKm: 3.0, rating: 4.0,
                     coordinate: .init(latitude: 6.2308, longitude: -75.5906), address: "Cra 70 #34-15, Belén")
        ]
    }
}
