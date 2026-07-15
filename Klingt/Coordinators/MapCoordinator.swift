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

    func showDetail(for resource: Resource) {
        path.append(MapRoute.resourceDetail(resource))
    }

    func pop() {
        path.removeLast()
    }
}
