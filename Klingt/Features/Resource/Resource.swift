//
//  Resource.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import CoreLocation
import SwiftUI

struct Resource: Identifiable, Hashable {
    let id: UUID
    let name: String
    let category: ResourceCategory
    let distanceInKm: Double
    let rating: Double
    let coordinate: CLLocationCoordinate2D
    let address: String

    static func == (lhs: Resource, rhs: Resource) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

enum ResourceCategory: String, CaseIterable, Identifiable {
    case legal = "Legal"
    case salud = "Salud"
    case comida = "Comida"
    case vivienda = "Vivienda"

    var id: String { rawValue }

    var tintColor: Color {
        switch self {
        case .legal: .indigo
        case .salud: .red
        case .comida: .orange
        case .vivienda: .green
        }
    }

    var iconName: String {
        switch self {
        case .legal: "building.columns.fill"
        case .salud: "cross.fill"
        case .comida: "fork.knife"
        case .vivienda: "house.fill"
        }
    }
}
