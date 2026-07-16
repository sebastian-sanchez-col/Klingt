//
//  CuriositiesCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum CuriositiesRoute: Hashable {
    case topicDetail(id: String)
}

final class CuriositiesCoordinator: ObservableObject, Coordinator, SelfInstantiatingCoordinator {
    
    
    @Published var path = NavigationPath()
    
    var childCoordinators: [Coordinator] = []
    
    static func make() -> CuriositiesCoordinator {
        return CuriositiesCoordinator()
    }
    
    func start() {
        
    }
    
    func push(_ route: CuriositiesRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
