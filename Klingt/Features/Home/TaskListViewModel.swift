//
//  TaskListViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import Foundation

@MainActor
final class TaskListViewModel: ObservableObject {
    @Published private(set) var tasks: [HomeTask] = []
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let homeCoordinator: HomeCoordinator
    private let tabCoordinator: MainTabCoordinator

    init(homeCoordinator: HomeCoordinator, tabCoordinator: MainTabCoordinator) {
        self.homeCoordinator = homeCoordinator
        self.tabCoordinator = tabCoordinator
    }

    // MARK: - Lifecycle

    func onAppear() {
        Task {
            await loadTasks()
        }
    }

    // MARK: - Data loading

    func loadTasks() async {
        isLoading = true
        errorMessage = nil

        do {
            tasks = try await fetchTasks()
        } catch {
            errorMessage = "No pudimos cargar las tareas. Inténtalo de nuevo."
        }

        isLoading = false
    }

    private func fetchTasks() async throws -> [HomeTask] {
        // TODO: replace with real networking/persistence call
        try await Task.sleep(nanoseconds: 300_000_000)
        return [
            HomeTask(title: "Revisar reporte semanal", section: "Hoy", dueDate: .now.addingTimeInterval(3600)),
            HomeTask(title: "Actualizar perfil de comunidad", section: "Hoy", isCompleted: true),
            HomeTask(title: "Confirmar cita médica", section: "Esta semana", dueDate: .now.addingTimeInterval(86_400))
        ]
    }

    // MARK: - Actions

    func toggleCompletion(for task: HomeTask) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
        // TODO: persist change via a service if needed
    }

    func delete(at offsets: IndexSet, in section: String) {
        let sectionTaskIDs = tasks.filter { $0.section == section }
            .enumerated()
            .filter { offsets.contains($0.offset) }
            .map { $0.element.id }
        tasks.removeAll { sectionTaskIDs.contains($0.id) }
        // TODO: persist deletion via a service if needed
    }

    func retry() {
        Task {
            await loadTasks()
        }
    }

    // MARK: - Navigation

    func didSelectTask(_ task: HomeTask) {
        // e.g. homeCoordinator.path.append(HomeRoute.taskDetail(task))
    }

    func goBack() {
        if !homeCoordinator.path.isEmpty {
            homeCoordinator.path.removeLast()
        }
    }
}
