//
//  MainTabCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

enum MainTab: Hashable {
    case home, curiosities, configuration
}

@MainActor
final class MainTabCoordinator: ObservableObject {
    @Published var selectedTab: MainTab = .home

    let homeCoordinator = HomeCoordinator()
    let curiositiesCoordinator = CuriositiesCoordinator()
    let configurationCoordinator = ConfigurationCoordinator()
}
