//
//  CommunityViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import Foundation

@MainActor
final class CommunityViewModel: ObservableObject {
    @Published private(set) var posts: [CommunityPost] = []
    @Published var selectedCategory: PostCategory = .todos

    private let service: CommunityServiceProtocol
    private let coordinator: CommunityCoordinator

    init(service: CommunityServiceProtocol = CommunityService(), coordinator: CommunityCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    var filteredPosts: [CommunityPost] {
        selectedCategory == .todos ? posts : posts.filter { $0.category == selectedCategory }
    }

    func load() async {
        posts = (try? await service.fetchPosts()) ?? []
    }

    func openDetail(_ post: CommunityPost) {
        coordinator.push(.postDetail(post))
    }
}
