//
//  MapCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum MapRoute: Hashable {
    case resourceDetail(Resource)
}

@MainActor
final class MapCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: MapRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
