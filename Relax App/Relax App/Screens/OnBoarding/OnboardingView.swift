//
//  OnboardingView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/13/22.
//

import SwiftUI

struct OnboardingView: View {
    
    var registrationAction: () -> Void
    var authorizationAction: () -> Void
    var guideAction: () -> Void
    
    var body: some View {
        ZStack {
            Image.Backgrounds.wood
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Image.Icons.logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 90)
                    .foregroundColor(Color.white)
                Text(Constants.greetingTitle)
                    .font(Font.alegreyaMedium(size: 30))
                    .foregroundColor(Color.white)
                VStack(alignment: .center, spacing: 0) {
                    Text(Constants.firstLineTitle)
                    Text(Constants.secondLineTitle)
                    Text(Constants.thirdLineTitle)
                }
                .foregroundColor(Color.white)
                .font(Font.alegreyaSansMedium(size: 18))
                
                BoldButton(title: Constants.buttonTitle, action: authorizationAction)
                    .padding(.horizontal, 30)
                Button(Constants.registerTitle, action: registrationAction)
                    .foregroundColor(Color.white)
                    .font(Font.alegreyaSansMedium(size: 18))
                Button(Constants.guideTitle, action: guideAction)
                    .foregroundColor(Color.white)
                    .font(Font.alegreyaSansMedium(size: 18))
            }
            
        }
    }
    
    private enum Constants {
        static let greetingTitle = "Hello".uppercased()
        static let firstLineTitle = "Enjoy qulification"
        static let secondLineTitle = "Be attentive"
        static let thirdLineTitle = "Do your job well"
        static let buttonTitle = "Sign in"
        static let registerTitle = "Don't have account yet? Register now!"
        static let guideTitle = "More about app..."
    }
}

