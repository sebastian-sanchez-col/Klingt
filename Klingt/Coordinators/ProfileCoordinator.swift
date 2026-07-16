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

@MainActor
final class ProfileCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: ProfileRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
