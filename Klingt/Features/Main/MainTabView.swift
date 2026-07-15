//
//  MainTabView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var tabCoordinator: MainTabCoordinator
    @EnvironmentObject private var appCoordinator: AppCoordinator

    var body: some View {
        TabView(selection: $tabCoordinator.selectedTab) {

            NavigationStack(path: Binding(
                get: { tabCoordinator.homeCoordinator.path },
                set: { tabCoordinator.homeCoordinator.path = $0 }
            )) {
                HomeView(viewModel: HomeViewModel(appCoordinator: appCoordinator))
                    .navigationDestination(for: HomeRoute.self) { route in
                        switch route {
                        case .recordingDetail(let id):
                            Text("Detalle de grabación \(id)")
                        }
                    }
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(MainTab.home)

            NavigationStack(path: Binding(
                get: { tabCoordinator.curiositiesCoordinator.path },
                set: { tabCoordinator.curiositiesCoordinator.path = $0 }
            )) {
                CuriositiesView()
                    .navigationDestination(for: CuriositiesRoute.self) { route in
                        switch route {
                        case .topicDetail(let id):
                            Text("Detalle de tema \(id)")
                        }
                    }
            }
            .tabItem {
                Image(systemName: "sparkles")
                Text("Curiosities")
            }
            .tag(MainTab.curiosities)

            NavigationStack(path: Binding(
                get: { tabCoordinator.configurationCoordinator.path },
                set: { tabCoordinator.configurationCoordinator.path = $0 }
            )) {
                ConfigurationView(
                    viewModel: ConfigurationViewModel(coordinator: tabCoordinator.configurationCoordinator)
                )
                .navigationDestination(for: ConfigurationRoute.self) { route in
                    switch route {
                    case .profile:
                        ProfileView(viewModel: ProfileViewModel())
                    case .notifications:
                        Text("Notificaciones")
                    }
                }
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("Configuration")
            }
            .tag(MainTab.configuration)
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(MainTabCoordinator())
}
