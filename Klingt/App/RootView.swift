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
        switch coordinator.route {
        case .onboarding(let onboardingCoordinator):
            OnboardingView(viewModel: OnboardingViewModel(coordinator: onboardingCoordinator))
        case .main(let mainTabCoordinator):
            MainTabView()
                .environmentObject(mainTabCoordinator)
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppCoordinator())
}
