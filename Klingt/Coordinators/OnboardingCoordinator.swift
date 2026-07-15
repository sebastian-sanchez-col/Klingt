//
//  OnboardingCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

@MainActor
final class OnboardingCoordinator: ObservableObject {
    @Published var selectedIndex: Int = 0

    private let totalSlides: Int

    var onFinish: (() -> Void)?

    init(totalSlides: Int = OnboardingScenario.allCases.count) {
        self.totalSlides = totalSlides
    }

    var isLastSlide: Bool {
        selectedIndex == totalSlides - 1
    }

    func next() {
        if isLastSlide {
            onFinish?()
        } else {
            selectedIndex += 1
        }
    }

    func skip() {
        onFinish?()
    }
}
