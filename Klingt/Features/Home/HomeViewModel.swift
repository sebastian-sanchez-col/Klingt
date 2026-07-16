//
//  HomeViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var userName = "User"
    @Published private(set) var tasks: [HomeTask] = []
    @Published private(set) var nearbyResources: [Resource] = []

    private let taskService: HomeTaskServiceProtocol
    private let resourceService: ResourceServiceProtocol
    private let homeCoordinator: HomeCoordinator
    private let tabCoordinator: MainTabCoordinator

    init(
        taskService: HomeTaskServiceProtocol = HomeTaskService(),
        resourceService: ResourceServiceProtocol = ResourceService(),
        homeCoordinator: HomeCoordinator,
        tabCoordinator: MainTabCoordinator
    ) {
        self.taskService = taskService
        self.resourceService = resourceService
        self.homeCoordinator = homeCoordinator
        self.tabCoordinator = tabCoordinator
    }

    var pendingTasksCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }

    func load() async {
        async let loadedTasks = (try? taskService.fetchTasks()) ?? []
        async let loadedResources = (try? resourceService.fetchNearbyResources()) ?? []
        tasks = await loadedTasks
        nearbyResources = await loadedResources
    }

    func openTaskList() {
        homeCoordinator.push(.taskList)
    }

    func openFullMap() {
        tabCoordinator.selectedTab = .map
    }
}
