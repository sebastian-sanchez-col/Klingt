//
//  OnboardingViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

@MainActor
final class OnboardingViewModel: ObservableObject {
    private let coordinator: OnboardingCoordinator

    let slides: [OnboardingScenario] = OnboardingScenario.allCases

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }

    var selectedIndex: Int {
        get { coordinator.selectedIndex }
        set { coordinator.selectedIndex = newValue }
    }

    var isLastSlide: Bool { coordinator.isLastSlide }

    func next() { coordinator.next() }
    func skip() { coordinator.skip() }
}
