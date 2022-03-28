//
//  ActivityView.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/28/22.
//

import SwiftUI

import SwiftUI

struct ActivityView: View {
    @State var isAnimating = false
    
    var body: some View {
        ZStack {
        Color.white
                .opacity(0.5)
                .shadow(color: .silverSand, radius: 10, x: 0, y: 10)
                .ignoresSafeArea()
        ZStack {
            Color.grannySmith
                
            Circle()
                .trim(from: 0.3, to: 1)
            
            .stroke(
                Color.outerSpace,
              style: StrokeStyle(
                lineWidth: 5,
                lineCap: .round
              )
            )
            .frame(width: 40, height: 40)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(
                .linear(duration: 1)
                .repeatForever(autoreverses: false))

        }
          .frame(width: 80, height: 80)
          .background(Color.white)
          .clipShape(Capsule(style: .continuous))
          .onAppear {
              isAnimating = true
          }
          .onDisappear {
              isAnimating = false
          }
          .transition(.opacity)
    }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
            .background(Color.red)
    }
}
