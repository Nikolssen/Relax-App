//
//  GuideView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/27/22.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        ZStack {
            Color.outerSpace
                .ignoresSafeArea()
            TabView {
                Image("User Guide")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(0)
                Image("Emotion Guide")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(1)
                Image("BMI Guide")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(2)
                Image("Music Guide")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(3)
                AuthorView()
                    .tag(4)
            }
            .tabViewStyle(.page)
        }

    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
