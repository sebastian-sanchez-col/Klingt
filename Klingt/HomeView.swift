//
//  HomeView.swift
//  Klingt
//
//  Created by Juan Sanchez on 9/08/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .scaledToFit()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Klingt")
            Text("Express yourself")
                .font(.title)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
