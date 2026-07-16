//
//  ProfileCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum ProfileRoute: Hashable {
    case settings
    case notifications
}

final class ProfileCoordinator: ObservableObject, Coordinator, SelfInstantiatingCoordinator {
    
    @Published var path = NavigationPath()
    
    var childCoordinators: [Coordinator] = []
    
    static func make() -> ProfileCoordinator {
        return ProfileCoordinator()
    }
    
    func start() {
        
    }
    
    func push(_ route: ProfileRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
