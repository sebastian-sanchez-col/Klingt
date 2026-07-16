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

@MainActor
final class HomeCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: HomeRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
