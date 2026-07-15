//
//  ProfileViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published private(set) var posts: [ProfilePost] = []
    @Published private(set) var isLoadingPosts = false

    private let postService: ProfilePostServiceProtocol

    init(
        name: String = "Alguien",
        email: String = "Alguien@example.com",
        postService: ProfilePostServiceProtocol = ProfilePostService()
    ) {
        self.name = name
        self.email = email
        self.postService = postService
    }

    func save() {
        print("Perfil guardado: \(name), \(email)")
    }

    func loadPosts() async {
        isLoadingPosts = true
        defer { isLoadingPosts = false }
        do {
            posts = try await postService.fetchPosts(forUserEmail: email)
        } catch {
            posts = []
        }
    }
}
