//
//  AppCoordinator.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

protocol SelfInstantiatingCoordinator: Coordinator {
    static func make() -> Self
}

extension Coordinator {
    func existingChildCoordinator<T: Coordinator>(ofType type: T.Type) -> T? {
        childCoordinators.first { $0 is T } as? T
    }

    func childCoordinator<T: SelfInstantiatingCoordinator>(ofType type: T.Type) -> T {
        if let existing = existingChildCoordinator(ofType: type) {
            return existing
        }
        let new = T.make()
        childCoordinators.append(new)
        return new
    }
}

final class AppCoordinator: ObservableObject, @MainActor Coordinator {
    enum AppRoute {
        case onboarding(OnboardingCoordinator)
        case main(MainTabCoordinator)
    }
    
    @Published var route: AppRoute
    private let hasSeenOnboardingKey: String = "hasSeenOnboarding"
    private let defaults: UserDefaults
    var childCoordinators: [Coordinator] = []
    
    @MainActor
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        let onboardingCoordinator = OnboardingCoordinator()
        route = .onboarding(onboardingCoordinator)
        
        onboardingCoordinator.onFinish = { [weak self] in
            self?.completeOnboarding()
        }
    }
    
    @MainActor
    private func completeOnboarding() {
        defaults.set(true, forKey: hasSeenOnboardingKey)
        showMain()
    }
    
    @MainActor
    private func createOnboardingCoordinator() -> OnboardingCoordinator {
        let onboardingCoordinator = OnboardingCoordinator()

        onboardingCoordinator.onFinish = { [weak self] in
            self?.completeOnboarding()
        }
        return onboardingCoordinator
    }
    
    @MainActor
    func start() {
        let hasSeenOnboarding = defaults.bool(forKey: hasSeenOnboardingKey)
        if hasSeenOnboarding {
            showMain()
        } else {
            showOnboarding()
        }
    }
    
    @MainActor
    func showMain() {
        let mainTabCoordinator = MainTabCoordinator()
        childCoordinators.append(mainTabCoordinator)
        mainTabCoordinator.start()
        route = .main(mainTabCoordinator)
    }
    
    @MainActor
    func showOnboarding() {
        let onboardingCoordinator = createOnboardingCoordinator()
        route = .onboarding(onboardingCoordinator)
    }
    
    @MainActor
    func replayOnboarding() {
        childCoordinators.removeAll { $0 is OnboardingCoordinator }
        let onboardingCoordinator = createOnboardingCoordinator()
        onboardingCoordinator.selectedIndex = 0
        route = .onboarding(onboardingCoordinator)
    }
}
