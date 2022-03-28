//
//  MediationDetailsView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/25/22.
//

import SwiftUI

struct MediationDetailsView: View {
    let advice: MeditationAdvice
    var body: some View {
        ZStack {
            Color.springWood
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text(advice.title)
                        .font(.alegreyaMedium(size: 35))
                    Spacer(minLength: 20)
                    Text(advice.description)
                        .font(.alegreyaSansMedium(size: 20))
                        .multilineTextAlignment(.leading)
                    Spacer(minLength: 20)
                    advice.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
                }
                .padding()
            }
        }
    }
}
