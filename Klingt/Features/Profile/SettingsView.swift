//
//  SettingsView.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        List {
            Section {
                Button {
                    viewModel.replayOnboarding()
                } label: {
                    Label("Ver introducción de nuevo", systemImage: "sparkles.rectangle.stack")
                }
            }

            Section {
                Button {
                    viewModel.goToNotifications()
                } label: {
                    Label("Notificaciones", systemImage: "bell")
                }
            }
        }
        .navigationTitle("Ajustes")
    }
}

#Preview {
    NavigationStack {
        SettingsView(viewModel: SettingsViewModel(
            profileCoordinator: ProfileCoordinator(),
            appCoordinator: AppCoordinator()
        ))
    }
}
