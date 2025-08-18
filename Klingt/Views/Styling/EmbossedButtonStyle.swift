//
//  EmbossedButtonStyle.swift
//  Klingt
//
//  Created by Juan Sanchez on 19/08/25.
//

import SwiftUI

enum EmbossedButtonShape {
  case circle, capsule
}

struct EmbossedButtonStyle: ButtonStyle {
  var buttonShape = EmbossedButtonShape.capsule
  var buttonScale = 1.0

  func makeBody(configuration: Configuration) -> some View {
    return configuration.label
      .padding(10)
      .background(
        GeometryReader { geometry in
          shape(size: geometry.size)
            .offset(x: -1, y: -1)
        })
      .scaleEffect(configuration.isPressed ? buttonScale : 1.0)
  }

  @ViewBuilder
  func shape(size: CGSize) -> some View {
    switch buttonShape {
    case .circle:
      Circle()
        .frame(
          width: max(size.width, size.height),
          height: max(size.width, size.height))
        .offset(x: -1)
        .offset(y: -max(size.width, size.height) / 2 +
          min(size.width, size.height) / 2)
    case .capsule:
      Capsule()
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  Button("History") {}
    .fontWeight(.bold)
    .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
    .padding(40)
}
