//
//  TabBarView.swift
//  Klingt
//
//  Created by Juan Sanchez on 14/08/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            TabView {
                HomeDashboardView()
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
    TabBarView()
}
