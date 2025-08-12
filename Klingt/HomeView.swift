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
            HStack {
              ForEach(0 ..< 5) { _ in
                Image(systemName: "waveform.path.ecg")
                  .foregroundStyle(.gray)
                  .font(.largeTitle)
              }
            }
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
