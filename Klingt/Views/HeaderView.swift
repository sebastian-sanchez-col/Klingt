//
//  HeaderView.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/08/25.
//

import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleText: String

  var body: some View {
    VStack {
      Text(titleText)
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.white)
      HStack {
        ForEach(PrincipalCarouselModel.models.indices, id: \.self) { index in
          ZStack {
            Circle()
              .frame(width: 32, height: 32)
              .foregroundColor(.white)
              .opacity(index == selectedTab ? 0.5 : 0.0)
            Circle()
              .frame(width: 16, height: 16)
              .foregroundColor(.white)
          }
          .onTapGesture {
            selectedTab = index
          }
        }
      }
      .font(.title2)
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  HeaderView(selectedTab: .constant(0), titleText: "Welcome")
}
