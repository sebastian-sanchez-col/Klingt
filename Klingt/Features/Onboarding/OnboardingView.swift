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
        ZStack(alignment: .topTrailing) {
            TabView(selection: $viewModel.selectedIndex) {
                ForEach(viewModel.slides.indices, id: \.self) { index in
                    OnboardingSlideView(
                        slide: viewModel.slides[index],
                        selectedTab: $viewModel.selectedIndex,
                        isLastSlide: index == viewModel.slides.count - 1,
                        onGetStarted: viewModel.next
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .always))

            Button("Skip") {
                viewModel.skip()
            }
            .font(.subheadline.bold())
            .foregroundStyle(.white)
            .padding()
        }
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(coordinator: OnboardingCoordinator()))
}
