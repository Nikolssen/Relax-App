//
//  DashboardView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/15/22.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel: DashboardViewModel
    var body: some View {
        ZStack {
            Color.outerSpace
                .ignoresSafeArea()
            VStack {
                
                Text("Welcome back, User!")
                    .font(.alegreyaMedium(size: 30))
                    .foregroundColor(.white)
                Text("What is your mood for today?")
                    .font(.alegreyaSansRegular(size: 22))
                    .foregroundColor(.white)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 15) {
                        ForEach(Emotion.allCases) { emotion in
                            Moodlet(mood: emotion, isSelected: emotion == viewModel.emotion)
                                .onTapGesture { viewModel.emotion = emotion }
                        }
                    }
                }
                Spacer()
                if let emotion = viewModel.emotion, let piecesOfAdvice = MeditationAdvice.advices.filter { $0.emotion == emotion } {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [.init(.flexible(minimum: 100, maximum: .infinity), spacing: 20, alignment: .center)]) {
                            ForEach(piecesOfAdvice, id: \.title) {
                                MeditationView(advice: $0)
                            }
                        }
                    }
                }

            }
        }
    }
}
