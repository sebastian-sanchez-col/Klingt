//
//  HomeViewModel.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var title = "Klingt"
    @Published var subtitle = "Express yourself"
}
