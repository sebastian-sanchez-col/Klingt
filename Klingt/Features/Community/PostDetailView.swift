//
//  PostDetailView.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import SwiftUI

struct PostDetailView: View {
    let post: CommunityPost

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(post.authorName).font(.headline)
            Text(post.title).font(.title3)
            HStack(spacing: 16) {
                Label("\(post.commentsCount) comentarios", systemImage: "bubble.right")
                Label("\(post.likesCount) me gusta", systemImage: "heart")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("Publicación")
        .navigationBarTitleDisplayMode(.inline)
    }
}
