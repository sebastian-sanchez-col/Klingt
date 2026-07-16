//
//  HomeTaskService.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

protocol HomeTaskServiceProtocol {
    func fetchTasks() async throws -> [HomeTask]
}

final class HomeTaskService: HomeTaskServiceProtocol {
    func fetchTasks() async throws -> [HomeTask] {
        try await Task.sleep(nanoseconds: 200_000_000)
        return [
            HomeTask(id: UUID(), title: "Sacar el documento de identidad", isCompleted: true, section: "Trámites Iniciales"),
            HomeTask(id: UUID(), title: "Abrir cuenta bancaria", isCompleted: false, section: "Trámites Iniciales"),
            HomeTask(id: UUID(), title: "Buscar alojamiento temporal", isCompleted: false, section: "Vivienda")
        ]
    }
}
