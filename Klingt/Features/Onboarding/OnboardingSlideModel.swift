//
//  PrincipalCarouselModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 14/08/25.
//

import Foundation

struct OnboardingSlideModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}

extension OnboardingSlideModel {
    static var slidesFromScenarios: [OnboardingSlideModel] {
        OnboardingScenario.allCases.map { scenario in
            OnboardingSlideModel(
                title: scenario.title,
                description: scenario.description,
                imageName: scenario.imageName
            )
        }
    }
}
