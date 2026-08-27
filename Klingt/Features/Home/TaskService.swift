//
//  TaskService.swift
//  Klingt
//
//  Created by Juan Sanchez on 27/07/26.
//

protocol TaskDataSource: AnyObject {
    func fetchTasks(completion: @escaping ([StepTask]) -> Void)
    func fetchTasks() async -> [StepTask]
}
