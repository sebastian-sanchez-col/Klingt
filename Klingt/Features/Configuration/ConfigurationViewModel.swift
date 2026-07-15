//
//  ConfigurationViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

@MainActor
final class ConfigurationViewModel: ObservableObject {
    private let coordinator: ConfigurationCoordinator

    init(coordinator: ConfigurationCoordinator) {
        self.coordinator = coordinator
    }

    func goToProfile() {
        coordinator.push(.profile)
    }

    func goToNotifications() {
        coordinator.push(.notifications)
    }
}
