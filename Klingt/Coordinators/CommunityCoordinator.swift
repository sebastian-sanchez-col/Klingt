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

@MainActor
final class CommunityCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func showDetail(for post: CommunityPost) {
        path.append(CommunityRoute.postDetail(post))
    }
}
