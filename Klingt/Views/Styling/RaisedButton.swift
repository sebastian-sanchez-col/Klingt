//
//  RaisedButton.swift
//  Klingt
//
//  Created by Juan Sanchez on 19/08/25.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText)
                .raisedButtonTextStyle()
        })
        .buttonStyle(.raised)
    }
}

struct RaisedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding([.top, .bottom], 12)
      .background(
        Capsule()
      )
  }
}

extension ButtonStyle where Self == RaisedButtonStyle {
  static var raised: RaisedButtonStyle {
    .init()
  }
}

extension Text {
  func raisedButtonTextStyle() -> some View {
    self
      .font(.body)
      .fontWeight(.bold)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  ZStack {
    RaisedButton(buttonText: "Get Started") {
      print("Hello World")
    }
    .buttonStyle(.raised)
    .padding(20)
  }
}
