//
//  ProfilePost.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

struct ProfilePost: Identifiable, Hashable {
    let id: UUID
    let title: String
    let createdAt: Date
    let likesCount: Int
    let commentsCount: Int
}

extension ProfilePost {
    static let mock: [ProfilePost] = [
        ProfilePost(id: UUID(), title: "Buscando arriendo cerca al metro", createdAt: .now.addingTimeInterval(-3600), likesCount: 4, commentsCount: 2),
        ProfilePost(id: UUID(), title: "Recomendación de trámite migratorio", createdAt: .now.addingTimeInterval(-86400), likesCount: 12, commentsCount: 5)
    ]
}
