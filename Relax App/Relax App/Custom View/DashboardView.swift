//
//  DashboardView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/15/22.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var user: User
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
                            Moodlet(mood: emotion, isSelected: emotion == user.emotion)
                                .onTapGesture { user.emotion = emotion }
                        }
                    }
                }
                Spacer()
                if let emotion = user.emotion, let piecesOfAdvice = MeditationAdvice.advices.filter { $0.emotion == emotion } {
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

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(User(name: "", email: "", birthdayDate: Date()))
    }
}
