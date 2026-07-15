//
//  HomeView.swift
//  Klingt
//
//  Created by Juan Sanchez on 14/08/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            HStack {
                ForEach(0..<5, id: \.self) { _ in
                    Image(systemName: "waveform.path.ecg")
                        .foregroundStyle(.gray)
                        .font(.largeTitle)
                }
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(viewModel.title)
            Text(viewModel.subtitle)
                .font(.title)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
