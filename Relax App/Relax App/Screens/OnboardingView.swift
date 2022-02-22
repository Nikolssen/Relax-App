//
//  OnboardingView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/13/22.
//

import SwiftUI

struct OnboardingView: View {
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
                
                BoldButton(title: Constants.buttonTitle, action: {})
                    .padding(.horizontal, 30)
                Button(Constants.registerTitle, action: {})
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
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
