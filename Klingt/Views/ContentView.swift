//
//  ContentView.swift
//  Klingt
//
//  Created by Juan Sanchez on 18/06/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9

    var body: some View {
        TabView(selection: $selectedTab) {
          PrincipalCarouselView(selectedTab: $selectedTab)
          ForEach(PrincipalCarouselModel.models.indices, id: \.self) { index in
              PrincipalCarouselSlideView(index: index)
          }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(
          PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
