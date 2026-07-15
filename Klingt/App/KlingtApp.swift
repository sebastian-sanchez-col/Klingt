//
//  KlingtApp.swift
//  Klingt
//
//  Created by Juan Sanchez on 18/06/25.
//

import SwiftUI

@main
struct KlingtApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var appCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appCoordinator)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
