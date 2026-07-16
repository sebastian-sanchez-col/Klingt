//
//  ConfigurationView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation
import SwiftUI

struct ConfigurationView: View {
    @ObservedObject var viewModel: ConfigurationViewModel

    var body: some View {
        List {
            Button("Ver introducción de nuevo") {
                viewModel.replayOnboarding()
            }
            Button("Notificaciones") {
                viewModel.goToNotifications()
            }
        }
        .navigationTitle("Configuración")
    }
}

#Preview {
    NavigationStack {
        ConfigurationView(viewModel: ConfigurationViewModel(profileCoordinator: ProfileCoordinator(), appCoordinator: AppCoordinator()))
    }
}
