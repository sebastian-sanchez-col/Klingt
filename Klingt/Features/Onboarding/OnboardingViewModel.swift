//
//  OnboardingViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

@MainActor
final class OnboardingViewModel: ObservableObject {
    private var coordinator: OnboardingCoordinator
    private let changeForwarder = ChangeForwarder()
    let slides: [OnboardingSlide] = OnboardingSlide.allCases

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        changeForwarder.forward(coordinator) { [weak self] in
            self?.objectWillChange.send()
        }
    }
    var selectedIndex: Int {
        get { coordinator.selectedIndex }
        set { coordinator.selectedIndex = newValue }
    }

    var isLastSlide: Bool { coordinator.isLastSlide }

    func next() { coordinator.next() }
    func skip() { coordinator.skip() }
}
