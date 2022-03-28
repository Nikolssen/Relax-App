//
//  AuthorizationView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/13/22.
//

import SwiftUI

struct AuthorizationView: View {
    @StateObject var viewModel: AuthorizationViewModel
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
                        Text(Constants.signInTitle)
                            .font(Font.alegreyaMedium(size: 30))
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    AuthTextField(isSecure: false, text: $viewModel.email, placeholder: Constants.emailPlaceholder)
                    AuthTextField(isSecure: true, text: $viewModel.password, placeholder: Constants.passwordPlaceholder)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    BoldButton(title: Constants.signInTitle, action: { viewModel.signIn() })
                    BoldButton(title: Constants.registerTitle, action: { viewModel.goToRegistration() })
                }
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .padding(.horizontal, 30)
            
            if viewModel.showSpinner {
                ActivityView()
            }
        }

        
    }
    private enum Constants {
        static let signInTitle = "Sign In"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let registerTitle = "Register"
        static let emailEmptyMessage = "E-mail is empty"
        static let passwordMessage = "Password is empty"
        static let passwordShortMessage = "Password must containt at least 6 characters"
    }
}
