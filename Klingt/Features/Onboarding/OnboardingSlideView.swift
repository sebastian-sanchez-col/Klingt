//
//  OnboardingSlideView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import SwiftUI

struct OnboardingSlideView: View {
    let slide: PrincipalCarouselModel
    @Binding var selectedTab: Int
    let isLastSlide: Bool
    let onGetStarted: () -> Void

    var body: some View {
        VStack {
            HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                .containerRelativeFrame(.vertical) { length, _ in
                    length * 0.2
                }

            Spacer()

            VStack(alignment: .leading) {
                Text(slide.name)
                    .font(.largeTitle)
                Text(slide.description)
                    .font(.headline)
            }
            .padding(.horizontal)

            Spacer()

            Button(action: onGetStarted) {
                Text(isLastSlide ? "Get Started" : "Next")
                Image(systemName: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
            )
        }
    }
}

#Preview {
    OnboardingSlideView(
        slide: PrincipalCarouselModel.models[0],
        selectedTab: .constant(0),
        isLastSlide: false,
        onGetStarted: {}
    )
}
