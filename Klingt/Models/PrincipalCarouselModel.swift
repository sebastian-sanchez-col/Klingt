//
//  PrincipalCarouselModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 14/08/25.
//

import Foundation

struct PrincipalCarouselModel {
  let name: String
  let videoName: String

  enum PrincipalCarouselModelEnum: String {
    case socialTeam = "Social team"
    case food = "Food"
    case home = "Home"
    case sunSalute = "Sun Salute"
  }
}

extension PrincipalCarouselModel {
  static let models = [
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.socialTeam.rawValue,
      videoName: "social-team"),
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.food.rawValue,
      videoName: "Food"),
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.home.rawValue,
      videoName: "Home"),
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.sunSalute.rawValue,
      videoName: "sun-salute")
  ]
}
