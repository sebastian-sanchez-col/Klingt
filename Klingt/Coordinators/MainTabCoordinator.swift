//
//  MainTabCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import Combine

enum MainTab: Hashable {
    case home, map, community, profile
}

final class MainTabCoordinator: ObservableObject, @MainActor Coordinator {
    @Published var selectedTab: MainTab = .home
    private var cancellables = Set<AnyCancellable>()
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

        observe(homeCoordinator)
        observe(mapCoordinator)
        observe(communityCoordinator)
        observe(profileCoordinator)
    }

    private func observe<T: ObservableObject>(_ coordinator: T)
        where T.ObjectWillChangePublisher == ObservableObjectPublisher
    {
        coordinator.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
