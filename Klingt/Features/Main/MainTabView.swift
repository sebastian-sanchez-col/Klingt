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
        let homeCoordinator = tabCoordinator.childCoordinator(ofType: HomeCoordinator.self)
        NavigationStack(path: homePathBinding) {
            HomeTabRootView(homeCoordinator: homeCoordinator, tabCoordinator: tabCoordinator)
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .taskList:
                        TaskListView(viewModel: TaskListViewModel(
                            homeCoordinator: homeCoordinator,
                            tabCoordinator: tabCoordinator
                        ))
                    }
                }
        }
    }

    private struct HomeTabRootView: View {
        @StateObject private var viewModel: HomeViewModel

        init(homeCoordinator: HomeCoordinator, tabCoordinator: MainTabCoordinator) {
            _viewModel = StateObject(wrappedValue: HomeViewModel(
                homeCoordinator: homeCoordinator,
                tabCoordinator: tabCoordinator
            ))
        }

        var body: some View {
            HomeView(viewModel: viewModel)
        }
    }
    @ViewBuilder
    private var mapTab: some View {
        let mapCoordinator = tabCoordinator.childCoordinator(ofType: MapCoordinator.self)
        NavigationStack(path: mapPathBinding) {
            MapTabRootView(coordinator: mapCoordinator)
                .navigationDestination(for: MapRoute.self) { route in
                    switch route {
                    case .resourceDetail(let resource):
                        ResourceDetailView(resource: resource)
                    }
                }
        }
    }
    
    private struct MapTabRootView: View {
        @StateObject private var viewModel: MapViewModel

        init(coordinator: MapCoordinator) {
            _viewModel = StateObject(wrappedValue: MapViewModel(coordinator: coordinator))
        }

        var body: some View {
            MapView(viewModel: viewModel)
        }
    }

    @ViewBuilder
    private var communityTab: some View {
        let communityCoordinator = tabCoordinator.childCoordinator(ofType: CommunityCoordinator.self)
        NavigationStack(path: communityPathBinding) {
            CommunityTabRootView(coordinator: communityCoordinator)
                .navigationDestination(for: CommunityRoute.self) { route in
                    switch route {
                    case .postDetail(let post):
                        PostDetailView(post: post)
                    }
                }
        }
    }
    
    private struct CommunityTabRootView: View {
        @StateObject private var viewModel: CommunityViewModel

        init(coordinator: CommunityCoordinator) {
            _viewModel = StateObject(wrappedValue: CommunityViewModel(coordinator: coordinator))
        }

        var body: some View {
            CommunityView(viewModel: viewModel)
        }
    }

    @ViewBuilder
    private var profileTab: some View {
        let profileCoordinator = tabCoordinator.childCoordinator(ofType: ProfileCoordinator.self)
        NavigationStack(path: profilePathBinding) {
            ProfileTabRootView(coordinator: profileCoordinator)
                .navigationDestination(for: ProfileRoute.self) { route in
                    switch route {
                    case .settings:
                        SettingsView(viewModel: SettingsViewModel(
                            profileCoordinator: profileCoordinator,
                            appCoordinator: appCoordinator
                        ))
                    case .notifications:
                        Text("Notificaciones")
                    }
                }
        }
    }
    
    private struct ProfileTabRootView: View {
        @StateObject private var viewModel: ProfileViewModel

        init(coordinator: ProfileCoordinator) {
            _viewModel = StateObject(wrappedValue: ProfileViewModel(coordinator: coordinator))
        }

        var body: some View {
            ProfileView(viewModel: viewModel)
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
