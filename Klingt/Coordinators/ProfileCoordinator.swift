//
//  ProfileCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum ProfileRoute: Hashable {
    case profileSettings
    case notifications
}

final class ProfileCoordinator: ObservableObject, @MainActor Coordinator, SelfInstantiatingCoordinator {
    
    @Published var path = NavigationPath()
    
    var childCoordinators: [Coordinator] = []
    
    static func make() -> ProfileCoordinator {
        return ProfileCoordinator()
    }
    
    @MainActor
    func start() {
        
    }
    
    @MainActor
    func push(_ route: ProfileRoute) {
        path.append(route)
    }
    
    @MainActor
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
