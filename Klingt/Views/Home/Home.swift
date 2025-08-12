//
//  Home.swift
//  Klingt
//
//  Created by Juan Sanchez on 12/08/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
          VStack {
            Text("Welcome")
            Spacer()
            Button("History") { }
              .padding(.bottom)
          }
          VStack {
            HStack(alignment: .bottom) {
              VStack(alignment: .leading) {
                Text("Know your city")
                  .font(.largeTitle)
                Text("and get help if you need it.")
                  .font(.headline)
              }
              Image("step-up")
                .resizedToFill(width: 240, height: 240)
                .clipShape(Circle())
            }
            Button(action: { }) {
              Text("Get Started")
              Image(systemName: "arrow.right.circle")
            }
            .font(.title2)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 20)
              .stroke(Color.gray, lineWidth: 2))
          }
        }
    }
}

#Preview {
    Home()
}
