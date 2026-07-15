//
//  ConfigurationView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import SwiftUI

struct ConfigurationView: View {
    @ObservedObject var viewModel: ConfigurationViewModel

    var body: some View {
        List {
            Button("Perfil") {
                viewModel.goToProfile()
            }
            Button("Notificaciones") {
                viewModel.goToNotifications()
            }
        }
        .navigationTitle("Configuration")
    }
}

#Preview {
    NavigationStack {
        ConfigurationView(viewModel: ConfigurationViewModel(coordinator: ConfigurationCoordinator()))
    }
}
