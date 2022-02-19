//
//  MeditationView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/16/22.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        ZStack {
            Color.springWood
            HStack {
            VStack {
                Text("Some title")
                    .font(.alegreyaMedium(size: 25))
                Text("Some long long long description")
                    .font(.alegreyaSansMedium(size: 14))
                Button(action: {}) {
                    Text("More...")
                        .font(Font.alegreyaSansMedium(size: 15))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 100, maxHeight: 35, alignment: .center)
                }
                .background(Color.outerSpace)
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
                Image("Meditation-Calm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200, alignment: .center)
            }
        }
        
        
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
