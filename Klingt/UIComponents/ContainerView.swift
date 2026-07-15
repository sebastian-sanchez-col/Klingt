//
//  ContainerView.swift
//  Klingt
//
//  Created by Juan Sanchez on 19/08/25.
//

import SwiftUI

struct ContainerView<Content: View>: View {
  var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25.0)
      VStack {
        Spacer()
        Rectangle()
          .frame(height: 25)
      }
      content
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  ContainerView {
    VStack {
      RaisedButton(buttonText: "Hello World") {}
        .padding(50)
      Button("Tap me!") {}
        .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
    }
  }
  .padding(50)
}
