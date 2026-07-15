//
//  AppCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

@MainActor
final class AppCoordinator: ObservableObject {

    enum Flow {
        case onboarding
        case main
    }

    @Published var flow: Flow

    let onboardingCoordinator: OnboardingCoordinator
    let mainTabCoordinator = MainTabCoordinator()

    private let hasSeenOnboardingKey = "hasSeenOnboarding"
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        let hasSeenOnboarding = defaults.bool(forKey: hasSeenOnboardingKey)
        self.flow = hasSeenOnboarding ? .main : .onboarding
        self.onboardingCoordinator = OnboardingCoordinator()

        self.onboardingCoordinator.onFinish = { [weak self] in
            self?.completeOnboarding()
        }
    }

    private func completeOnboarding() {
        defaults.set(true, forKey: hasSeenOnboardingKey)
        flow = .main
    }
}
