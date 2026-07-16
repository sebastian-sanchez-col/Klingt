//
//  HomeTask.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

struct HomeTask: Identifiable, Equatable {
    let id: UUID
    var title: String
    var section: String
    var isCompleted: Bool
    var dueDate: Date?

    init(
        id: UUID = UUID(),
        title: String,
        section: String,
        isCompleted: Bool = false,
        dueDate: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.section = section
        self.isCompleted = isCompleted
        self.dueDate = dueDate
    }
}
