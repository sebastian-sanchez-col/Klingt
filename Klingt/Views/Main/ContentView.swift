//
//  ContentView.swift
//  Klingt
//
//  Created by Juan Sanchez on 18/06/25.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        ZStack {
            TabView {
               Home()
                   .tabItem {
                       Image(systemName: "1.circle")
                       Text("Home")
                   }
               Text("Curiosities")
                   .tabItem {
                       Image(systemName: "2.circle")
                       Text("Curiosities")
                   }
               Text("Configuration")
                   .tabItem {
                       Image(systemName: "3.circle")
                       Text("Configuration")
                   }
           }
        }
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//        .colorScheme(.dark)
//        .background(Color.black)
}
