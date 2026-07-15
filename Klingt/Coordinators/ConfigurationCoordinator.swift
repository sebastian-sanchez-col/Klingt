//
//  ConfigurationCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum ConfigurationRoute: Hashable {
    case profile
    case notifications
}

@MainActor
final class ConfigurationCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: ConfigurationRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
