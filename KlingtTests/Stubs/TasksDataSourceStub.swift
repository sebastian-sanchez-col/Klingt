//
//  TasksDataSourceStub.swift
//  Klingt
//
//  Created by Juan Sanchez on 27/07/26.
//

@testable import Klingt
import Foundation

class TaskDataSourceStub: TaskDataSource {
    func fetchTasks(completion: @escaping ([StepTask]) -> Void) {
        fetchTasks(randomDelay: true, completion: completion)
    }

    func fetchTasks() async -> [StepTask] {
        await withCheckedContinuation { continuation in
            fetchTasks(randomDelay: false) { reminders in
                continuation.resume(returning: reminders)
            }
        }
    }

    private func fetchTasks(randomDelay: Bool, completion: @escaping ([StepTask]) -> Void) {
        let reminders = [
            StepTask(id: UUID(), message: "Submit project proposal"),
            StepTask(id: UUID(), message: "Review design specifications"),
            StepTask(id: UUID(), message: "Schedule stakeholder meeting"),
            StepTask(id: UUID(), message: "Finalize budget review")
        ]
        DispatchQueue.main.asyncAfter(deadline: .now() + (randomDelay ? Double.random(in: 0.1...0.5) : 0.3)) {
            completion(reminders)
        }
    }
}
