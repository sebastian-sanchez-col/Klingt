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

final class MapCoordinator: ObservableObject, @MainActor Coordinator, SelfInstantiatingCoordinator {
    @Published var path = NavigationPath()
    
    var childCoordinators: [Coordinator] = []
    
    static func make() -> MapCoordinator {
        return MapCoordinator()
    }
    
    @MainActor 
    func start() {
        
    }
    
    
    @MainActor 
    func push(_ route: MapRoute) {
        path.append(route)
    }
    
    @MainActor 
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
