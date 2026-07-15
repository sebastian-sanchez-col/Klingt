//
//  PrincipalCarouselModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 14/08/25.
//

import Foundation

struct PrincipalCarouselModel {
    let name: String
    let description: String
    
    enum PrincipalCarouselTitleEnum: String {
        case socialTeam = "Know your city"
        case food = "Food"
        case home = "Home"
    }
    enum PrincipalCarouselDescriptionEnum: String {
        case socialTeam = "and get help if you need it."
        case food = "Food"
        case home = "Home"
    }
}

extension PrincipalCarouselModel {
    static let models = [
        PrincipalCarouselModel(
            name: PrincipalCarouselTitleEnum.socialTeam.rawValue,
            description: PrincipalCarouselDescriptionEnum.socialTeam.rawValue),
        PrincipalCarouselModel(
            name: PrincipalCarouselDescriptionEnum.food.rawValue,
            description: PrincipalCarouselDescriptionEnum.food.rawValue),
        PrincipalCarouselModel(
            name: PrincipalCarouselDescriptionEnum.home.rawValue,
            description: PrincipalCarouselDescriptionEnum.home.rawValue)
    ]
}
