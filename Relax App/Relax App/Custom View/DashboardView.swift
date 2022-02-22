//
//  DashboardView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/15/22.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            Color.outerSpace
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Welcome back, User!")
                    .font(.alegreyaMedium(size: 30))
                    .foregroundColor(.white)
                Text("What is your mood for today?")
                    .font(.alegreyaSansRegular(size: 22))
                    .foregroundColor(.white)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 15) {
                        ForEach(Emotion.allCases) {
                            Moodlet(mood: $0, isSelected: false)
                        }
                    }
                }
                Spacer()
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [.init(.flexible(minimum: 100, maximum: .infinity), spacing: 20, alignment: .center)]) {
                        MeditationView(advice: MeditationAdvice(image: Image("Meditation-Calm"), title: "Relax", description: "Some long advice"))
                        MeditationView(advice: MeditationAdvice(image: Image("Meditation-Calm"), title: "Relax", description: "Some long advice"))
                        MeditationView(advice: MeditationAdvice(image: Image("Meditation-Calm"), title: "Relax", description: "Some long advice"))
                    }
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
