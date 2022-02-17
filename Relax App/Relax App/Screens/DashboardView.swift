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
                HStack {
                    Image.hamburger
                        .resizable()
                        .frame(width: 23, height: 23, alignment: .center)
                        .foregroundColor(Color.white)
                    Spacer()
                    Image.Icons.logo
                        .resizable()
                        .frame(width: 48, height: 48, alignment: .center)
                        .foregroundColor(.white)
                    Spacer()
                    Image.Icons.user
                        .resizable()
                        .frame(width: 36, height: 36, alignment: .center)
                        .clipShape(Circle())
                }
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
            }


        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
