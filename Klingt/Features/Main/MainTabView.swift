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
            homeTab
                .tabItem { Image(systemName: "house.fill"); Text("Inicio") }
                .tag(MainTab.home)

            mapTab
                .tabItem { Image(systemName: "map.fill"); Text("Mapa") }
                .tag(MainTab.map)

            communityTab
                .tabItem { Image(systemName: "person.2.fill"); Text("Comunidad") }
                .tag(MainTab.community)

            profileTab
                .tabItem { Image(systemName: "person.fill"); Text("Perfil") }
                .tag(MainTab.profile)
        }
    }

    @ViewBuilder
    private var homeTab: some View {
        NavigationStack(path: homePathBinding) {
            HomeView(viewModel: HomeViewModel(
                homeCoordinator: tabCoordinator.childCoordinator(ofType: HomeCoordinator.self),
                tabCoordinator: tabCoordinator
            ))
            .navigationDestination(for: HomeRoute.self) { route in
                switch route {
                case .taskList:
                    TaskListView(viewModel: HomeViewModel(
                        homeCoordinator: tabCoordinator.childCoordinator(ofType: HomeCoordinator.self),
                        tabCoordinator: tabCoordinator
                    ))
                }
            }
        }
    }

    @ViewBuilder
    private var mapTab: some View {
        NavigationStack(path: mapPathBinding) {
            MapView(viewModel: MapViewModel(coordinator: tabCoordinator.childCoordinator(ofType: MapCoordinator.self)))
                .navigationDestination(for: MapRoute.self) { route in
                    switch route {
                    case .resourceDetail(let resource):
                        ResourceDetailView(resource: resource)
                    }
                }
        }
    }

    @ViewBuilder
    private var communityTab: some View {
        NavigationStack(path: communityPathBinding) {
            CommunityView(viewModel: CommunityViewModel(coordinator: tabCoordinator.childCoordinator(ofType: CommunityCoordinator.self)))
                .navigationDestination(for: CommunityRoute.self) { route in
                    switch route {
                    case .postDetail(let post):
                        PostDetailView(post: post)
                    }
                }
        }
    }

    @ViewBuilder
    private var profileTab: some View {
        NavigationStack(path: profilePathBinding) {
            ProfileView(viewModel: ProfileViewModel(coordinator: tabCoordinator.childCoordinator(ofType: ProfileCoordinator.self)))
                .navigationDestination(for: ProfileRoute.self) { route in
                    switch route {
                    case .settings:
                        SettingsView(viewModel: SettingsViewModel(
                            profileCoordinator: tabCoordinator.childCoordinator(ofType: ProfileCoordinator.self),
                            appCoordinator: appCoordinator
                        ))
                    case .notifications:
                        Text("Notificaciones")
                    }
                }
        }
    }
    
    private var homePathBinding: Binding<NavigationPath> {
        Binding(
            get: { tabCoordinator.childCoordinator(ofType: HomeCoordinator.self).path },
            set: { tabCoordinator.childCoordinator(ofType: HomeCoordinator.self).path = $0 }
        )
    }

    private var mapPathBinding: Binding<NavigationPath> {
        Binding(
            get: { tabCoordinator.childCoordinator(ofType: MapCoordinator.self).path },
            set: { tabCoordinator.childCoordinator(ofType: MapCoordinator.self).path = $0 }
        )
    }

    private var communityPathBinding: Binding<NavigationPath> {
        Binding(
            get: { tabCoordinator.childCoordinator(ofType: CommunityCoordinator.self).path },
            set: { tabCoordinator.childCoordinator(ofType: CommunityCoordinator.self).path = $0 }
        )
    }

    private var profilePathBinding: Binding<NavigationPath> {
        Binding(
            get: { tabCoordinator.childCoordinator(ofType: ProfileCoordinator.self).path },
            set: { tabCoordinator.childCoordinator(ofType: ProfileCoordinator.self).path = $0 }
        )
    }
}

#Preview {
    MainTabView()
        .environmentObject(MainTabCoordinator())
        .environmentObject(AppCoordinator())
}
