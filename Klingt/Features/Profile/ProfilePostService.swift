//
//  ProfilePostService.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

protocol ProfilePostServiceProtocol {
    func fetchPosts(forUserEmail email: String) async throws -> [ProfilePost]
}

final class ProfilePostService: ProfilePostServiceProtocol {
    func fetchPosts(forUserEmail email: String) async throws -> [ProfilePost] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return ProfilePost.mock
    }
}
