//
//  CommunityService.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

protocol CommunityServiceProtocol {
    func fetchPosts() async throws -> [CommunityPost]
}

final class CommunityService: CommunityServiceProtocol {
    func fetchPosts() async throws -> [CommunityPost] {
        try await Task.sleep(nanoseconds: 300_000_000)
        return [
            CommunityPost(id: UUID(), authorName: "María P.", minutesAgo: 1, title: "¿Alguien sabe de arriendos económicos cerca del Metro?", commentsCount: 25, likesCount: 10, category: .vivienda),
            CommunityPost(id: UUID(), authorName: "Mares A.", minutesAgo: 129, title: "¿Alguien sabe de arriendos cerca del Metro?", commentsCount: 5, likesCount: 1, category: .vivienda),
            CommunityPost(id: UUID(), authorName: "María P.", minutesAgo: 28, title: "Buscar alojamiento temporal?", commentsCount: 3, likesCount: 2, category: .vivienda),
            CommunityPost(id: UUID(), authorName: "María P.", minutesAgo: 20, title: "¿Alguien sabe de arriendos cerca del Metro?", commentsCount: 4, likesCount: 2, category: .trabajo)
        ]
    }
}
