//
//  CommunityCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum CommunityRoute: Hashable {
    case postDetail(CommunityPost)
}

final class CommunityCoordinator: ObservableObject, Coordinator, SelfInstantiatingCoordinator {
    @Published var path = NavigationPath()
    
    var childCoordinators: [Coordinator] = []
    
    static func make() -> CommunityCoordinator {
        return CommunityCoordinator()
    }
    
    func start() {
        
    }
    
    func push(_ route: CommunityRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
