//
//  RegistrationView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/25/22.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel: RegistrationViewModel
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                HStack {
                    VStack {
                        Image.Icons.logo
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48, height: 48, alignment: .leading)
                            .foregroundColor(Color.white)
                        Text(Constants.registration)
                            .font(Font.alegreyaMedium(size: 30))
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    AuthTextField(isSecure: false, text: $viewModel.email, placeholder: Constants.emailPlaceholder)
                    AuthTextField(isSecure: true, text: $viewModel.password, placeholder: Constants.passwordPlaceholder)
                    AuthTextField(isSecure: false, text: $viewModel.name, placeholder: Constants.namePlaceholder)
                    DatePicker(Constants.birthDateTitle, selection: $viewModel.date, displayedComponents: .date)
                        .font(Font.alegreyaSansRegular(size: 20))
                        .foregroundColor(Color.white)
                        .accentColor(.white)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    BoldButton(title: Constants.registerTitle, action: { viewModel.register() })
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .ignoresSafeArea(.keyboard)
            
            if viewModel.showSpinner {
                ActivityView()
                
            }
        }
    }
    private enum Constants {
        static let registration = "Register"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let namePlaceholder = "Name"
        static let registerTitle = "Register"
        static let birthDateTitle = "Birth Date"
        static let emailEmptyMessage = "E-mail is empty"
        static let nameEmptyMessage = "Name is empty"
        static let passwordMessage = "Password is empty"
        static let passwordShortMessage = "Password must containt at least 6 characters"
        static let dateFutureMessage = "Birth date must not be in future!"
    }
}
