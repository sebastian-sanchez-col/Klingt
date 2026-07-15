//
//  Resource.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

struct Resource: Identifiable, Hashable {
    let id: UUID
    let name: String
    let category: ResourceCategory
    let distanceInKm: Double
    let rating: Double
    let latitude: Double
    let longitude: Double
}

enum ResourceCategory: String, CaseIterable {
    case legal, salud, comida, vivienda
}
