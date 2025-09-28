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
    @Binding var selectedTab: Int
    @State var isPresented = false
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: "Welcome"
                )
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
                
                Spacer()
                Button(action: { isPresented = true }) {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
                }
                .font(.title2)
                .padding()
                .fullScreenCover(isPresented: $isPresented) {
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
    PrincipalCarouselSlideView(index: 0, selectedTab: .constant(9))
}
