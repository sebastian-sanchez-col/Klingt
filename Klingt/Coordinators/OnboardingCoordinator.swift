//
//  OnboardingCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

final class OnboardingCoordinator: ObservableObject, @MainActor Coordinator {
    @Published var selectedIndex = 0
    private let totalSlides: Int
    var childCoordinators: [Coordinator] = []
    var onFinish: (() -> Void)?
    
    func start() {
        
    }

    init(totalSlides: Int = OnboardingSlide.allCases.count) {
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
