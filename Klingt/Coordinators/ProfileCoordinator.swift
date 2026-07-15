//
//  ProfileCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

enum ProfileRoute: Hashable {
    case postDetail(ProfilePost)
}

@MainActor
final class ProfileCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func showDetail(for post: ProfilePost) {
        path.append(ProfileRoute.postDetail(post))
    }
}
