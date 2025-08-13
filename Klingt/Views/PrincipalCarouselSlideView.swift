//
//  PrincipalCarouselSlideView.swift
//  Klingt
//
//  Created by Juan Sanchez on 14/08/25.
//


import SwiftUI
import AVKit

struct PrincipalCarouselSlideView: View {
  let index: Int
  var slide: PrincipalCarouselModel {
      PrincipalCarouselModel.models[index]
  }
  let interval: TimeInterval = 30
  @State var isLastPage = false

  var body: some View {
    GeometryReader { geometry in
      VStack {
        Text(slide.name)
          .padding(.bottom)

        Text("videoName: slide.videoName")
          .background(Color.white)
          .frame(height: geometry.size.height * 0.45)

        Text(Date().addingTimeInterval(interval), style: .timer)
          .font(.system(size: geometry.size.height * 0.07))

        Button("Start/Done") { }
          .font(.title3)
          .padding()

        Text("Rating *****")
          .padding()

        Spacer()
        Button("History") {
            isLastPage = true
        }
          .padding(.bottom)
          .fullScreenCover(isPresented: $isLastPage) {
              HomeDashboardView()
          }
      }
    }
  }
}

#Preview {
  PrincipalCarouselSlideView(index: 0)
}
