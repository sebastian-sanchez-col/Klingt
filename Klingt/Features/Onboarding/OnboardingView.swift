//
//  OnboardingView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button(action: viewModel.skip) {
                    Text("Saltar")
                        .font(.subheadline.bold())
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
            }
            .padding(.top, 10)

            TabView(selection: $viewModel.selectedIndex) {
                ForEach(viewModel.slides.indices, id: \.self) { index in
                    OnboardingSlideView(
                        slide: viewModel.slides[index],
                        selectedTab: $viewModel.selectedIndex,
                        isLastSlide: index == viewModel.slides.count - 1,
                        onNext: viewModel.next
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: viewModel.selectedIndex)
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(coordinator: OnboardingCoordinator()))
}
