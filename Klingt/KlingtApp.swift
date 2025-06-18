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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
