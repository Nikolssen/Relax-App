//
//  MeditationView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/16/22.
//

import SwiftUI

struct MeditationView: View {
    let advice: MeditationAdvice
    let action: () -> Void
    var body: some View {
        ZStack {
            Color.springWood
            HStack {
                VStack {
                    Text(advice.title)
                        .font(.alegreyaMedium(size: 25))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                    Text(advice.shortDescription)
                        .font(.alegreyaSansMedium(size: 14))
                        .foregroundColor(.gray)
                    Button(action: action) {
                        Text("More...")
                            .font(Font.alegreyaSansMedium(size: 15))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 100, maxHeight: 35, alignment: .center)
                    }
                    .background(Color.outerSpace)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                }
                .padding()
                advice.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 180, maxHeight: 200, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(.horizontal, 10)
        
        
    }
}
