//
//  MapViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import Foundation
import CoreLocation

@MainActor
final class MapViewModel: ObservableObject {
    @Published private(set) var resources: [Resource] = []
    @Published var selectedCategory: ResourceCategory?
    @Published var searchText = ""
    @Published var selectedResource: Resource?

    private let service: ResourceServiceProtocol
    private let coordinator: MapCoordinator

    init(service: ResourceServiceProtocol = ResourceService(), coordinator: MapCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    var filteredResources: [Resource] {
        resources.filter { resource in
            let matchesCategory = selectedCategory == nil || resource.category == selectedCategory
            let matchesSearch = searchText.isEmpty || resource.name.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }

    func load() async {
        resources = (try? await service.fetchNearbyResources()) ?? []
        selectedResource = resources.first
    }

    func select(_ resource: Resource) {
        selectedResource = resource
    }

    func openDetail(_ resource: Resource) {
        coordinator.push(.resourceDetail(resource))
    }
}
