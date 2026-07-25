//
//  MainTabCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

enum MainTab: Hashable {
    case home, map, community, profile
}

final class MainTabCoordinator: ObservableObject, @MainActor Coordinator {
    @Published var selectedTab: MainTab = .home
    private let changeForwarder = ChangeForwarder()
    var childCoordinators: [Coordinator] = []
    
    func start() {
        
    }
    
    @MainActor
    init(
        homeCoordinator: HomeCoordinator = HomeCoordinator(),
        mapCoordinator: MapCoordinator = MapCoordinator(),
        communityCoordinator: CommunityCoordinator = CommunityCoordinator(),
        profileCoordinator: ProfileCoordinator = ProfileCoordinator()
    ) {
        childCoordinators.append(homeCoordinator)
        childCoordinators.append(mapCoordinator)
        childCoordinators.append(communityCoordinator)
        childCoordinators.append(profileCoordinator)

        // Forward each child's changes so this coordinator (and its observers) re-render.
        changeForwarder.forward(childCoordinators) { [weak self] in
            self?.objectWillChange.send()
        }
    }
}
