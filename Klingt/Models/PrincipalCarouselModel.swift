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
    case squat = "Squat"
    case stepUp = "Step Up"
    case burpee = "Burpee"
    case sunSalute = "Sun Salute"
  }
}

extension PrincipalCarouselModel {
  static let models = [
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.squat.rawValue,
      videoName: "squat"),
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.stepUp.rawValue,
      videoName: "step-up"),
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.burpee.rawValue,
      videoName: "burpee"),
    PrincipalCarouselModel(
      name: PrincipalCarouselModelEnum.sunSalute.rawValue,
      videoName: "sun-salute")
  ]
}
