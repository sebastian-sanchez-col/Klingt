//
//  OnboardingTask.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

struct OnboardingTask: Identifiable, Hashable {
    let id: UUID
    let title: String
    var isCompleted: Bool
    let section: String
}
