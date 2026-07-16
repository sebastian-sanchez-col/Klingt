//
//  CommunityView.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import SwiftUI

struct CommunityView: View {
    @ObservedObject var viewModel: CommunityViewModel

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                categoryPicker

                List(viewModel.filteredPosts) { post in
                    Button { viewModel.openDetail(post) } label: {
                        postRow(post)
                    }
                    .buttonStyle(.plain)
                }
                .listStyle(.plain)
            }

            Button {
                // TODO: acción de crear post
            } label: {
                Image(systemName: "plus")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(Circle().fill(Color.orange))
                    .shadow(radius: 4)
            }
            .padding()
        }
        .navigationTitle("Comunidad")
        .task { await viewModel.load() }
    }

    private var categoryPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(PostCategory.allCases) { category in
                    let isSelected = viewModel.selectedCategory == category
                    Button {
                        viewModel.selectedCategory = category
                    } label: {
                        Text(category.rawValue)
                            .font(.subheadline.weight(.medium))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Capsule().fill(isSelected ? Color.accentColor : Color(.secondarySystemBackground)))
                            .foregroundStyle(isSelected ? .white : .primary)
                    }
                }
            }
            .padding()
        }
    }

    private func postRow(_ post: CommunityPost) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Circle()
                    .fill(Color(.tertiarySystemFill))
                    .frame(width: 32, height: 32)
                    .overlay(Text(String(post.authorName.prefix(1))).font(.caption.bold()))
                Text(post.authorName).font(.subheadline.bold())
                Text("\(post.minutesAgo)m").font(.caption).foregroundStyle(.secondary)
            }
            Text(post.title).foregroundStyle(.primary)
            HStack(spacing: 16) {
                Label("\(post.commentsCount)", systemImage: "bubble.right")
                Label("\(post.likesCount)", systemImage: "heart")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        CommunityView(viewModel: CommunityViewModel(coordinator: CommunityCoordinator()))
    }
}
