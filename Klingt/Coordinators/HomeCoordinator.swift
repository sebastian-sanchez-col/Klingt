//
//  HomeCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum HomeRoute: Hashable {
    case taskList
}

final class HomeCoordinator: ObservableObject, Coordinator, SelfInstantiatingCoordinator {
    
    @Published var path = NavigationPath()
    
    var childCoordinators: [Coordinator] = []
    private var _viewModel: HomeViewModel?
    static func make() -> HomeCoordinator {
        return HomeCoordinator()
    }
    
    func start() {
    
    }

    func push(_ route: HomeRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
