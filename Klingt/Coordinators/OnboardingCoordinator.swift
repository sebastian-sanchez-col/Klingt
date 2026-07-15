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

    let slides = PrincipalCarouselModel.models

    var onFinish: (() -> Void)?

    var isLastSlide: Bool {
        selectedIndex == slides.count - 1
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
