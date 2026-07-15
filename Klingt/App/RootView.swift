//
//  RootView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var coordinator: AppCoordinator

    var body: some View {
        switch coordinator.flow {
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel(coordinator: coordinator.onboardingCoordinator))
        case .main:
            MainTabView()
                .environmentObject(coordinator.mainTabCoordinator)
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppCoordinator())
}
