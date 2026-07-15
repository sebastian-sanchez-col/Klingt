//
//  OnboardingSlideView.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//
import SwiftUI

struct OnboardingSlideView: View {
    let slide: OnboardingScenario
    @Binding var selectedTab: Int
    let isLastSlide: Bool
    let onGetStarted: () -> Void

    var body: some View {
        VStack {
    
            HeaderView(
                selectedTab: $selectedTab,
                titleText: isLastSlide ? "¡Todo listo!" : "Bienvenido"
            )
            .containerRelativeFrame(.vertical) { length, _ in
                length * 0.2
            }

            Spacer()
            
            Image(slide.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 220)
                .padding(.horizontal, 30)

            Spacer()

            VStack(alignment: .leading, spacing: 12) {
                Text(slide.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                Text(slide.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
            }
            .padding(.horizontal, 24)

            Spacer()

            Button(action: {
                if isLastSlide {
                    onGetStarted()
                } else {
                    withAnimation {
                        selectedTab += 1
                    }
                }
            }) {
                HStack(spacing: 8) {
                    Text(isLastSlide ? "Comenzar" : "Siguiente")
                        .fontWeight(.semibold)
                    Image(systemName: isLastSlide ? "checkmark.circle.fill" : "arrow.right.circle.fill")
                }
                .font(.title3)
                .foregroundColor(isLastSlide ? .white : .accentColor)
                .padding(.vertical, 14)
                .padding(.horizontal, 32)
                .background(
                    Group {
                        if isLastSlide {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.accentColor)
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.accentColor, lineWidth: 2)
                        }
                    }
                )
            }
            .padding(.bottom, 20)
        }
    }
}
