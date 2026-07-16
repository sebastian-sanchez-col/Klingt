//
//  SettingsViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {
    private let profileCoordinator: ProfileCoordinator
    private let appCoordinator: AppCoordinator

    init(profileCoordinator: ProfileCoordinator, appCoordinator: AppCoordinator) {
        self.profileCoordinator = profileCoordinator
        self.appCoordinator = appCoordinator
    }

    func goToNotifications() {
        profileCoordinator.push(.notifications)
    }

    func replayOnboarding() {
        appCoordinator.replayOnboarding()
    }
}
