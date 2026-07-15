//
//  CommunityPost.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

struct CommunityPost: Identifiable, Hashable {
    let id: UUID
    let authorName: String
    let minutesAgo: Int
    let title: String
    let commentsCount: Int
    let likesCount: Int
    let category: PostCategory
}

enum PostCategory: String, CaseIterable {
    case todos, vivienda, trabajo, historias
}
