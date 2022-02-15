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
                Image.lotus
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
        static let greetingTitle = "Привет".uppercased()
        static let firstLineTitle = "Наслаждайся отборочными."
        static let secondLineTitle = "Будь внимателен."
        static let thirdLineTitle = "Делай хорошо."
        static let buttonTitle = "Войти в аккаунт"
        static let registerTitle = "Еще нет аккаунта? Зарегистрируйтесь"
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
