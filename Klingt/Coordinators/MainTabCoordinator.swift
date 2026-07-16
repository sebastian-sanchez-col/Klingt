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

@MainActor
final class MainTabCoordinator: ObservableObject {
    @Published var selectedTab: MainTab = .home

    let homeCoordinator = HomeCoordinator()
    let mapCoordinator = MapCoordinator()
    let communityCoordinator = CommunityCoordinator()
    let profileCoordinator = ProfileCoordinator()
}
