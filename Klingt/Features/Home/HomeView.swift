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

            Button(action: viewModel.showOnboardingAgain) {
                Label("Ver introducción de nuevo", systemImage: "sparkles.rectangle.stack")
                    .font(.subheadline.weight(.medium))
            }
            .buttonStyle(.bordered)
            .tint(.secondary)
            .controlSize(.regular)
            .padding(.bottom, 12)
        }
        .padding()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(appCoordinator: AppCoordinator()))
}
