//
//  ProfileView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        Form {
            Section("Información personal") {
                TextField("Nombre", text: $viewModel.name)
                TextField("Correo", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }

            Section {
                Button("Guardar") {
                    viewModel.save()
                }
            }

            Section("Mis publicaciones") {
                if viewModel.isLoadingPosts {
                    ProgressView()
                } else if viewModel.posts.isEmpty {
                    Text("Aún no tienes publicaciones")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(viewModel.posts) { post in
                        ProfilePostRowView(post: post)
                    }
                }
            }
        }
        .navigationTitle("Perfil")
        .task {
            await viewModel.loadPosts()
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(viewModel: ProfileViewModel())
    }
}
