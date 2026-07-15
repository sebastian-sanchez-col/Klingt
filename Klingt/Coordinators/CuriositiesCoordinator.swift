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

@MainActor
final class CuriositiesCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: CuriositiesRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
}
