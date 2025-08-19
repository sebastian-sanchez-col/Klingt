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
      ZStack {
        VStack {
        Text(slide.name)
          .padding(.bottom)

        Text("videoName: slide.videoName")
          .background(Color.white)

        Button("Start/Done") { }
          .font(.title3)
          .padding()

        Text("Rating *****")
          .padding()

        Spacer()
          Button(action: { isLastPage = true }) {
            Text("Get Started")
            Image(systemName: "arrow.right.circle")
          }
          .font(.title2)
          .padding()
          .fullScreenCover(isPresented: $isLastPage) {
              HomeDashboardView()
          }
          .background(
            RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 2))
          
      }
    }
  }
}

#Preview {
  PrincipalCarouselSlideView(index: 0)
}
