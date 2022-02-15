//
//  AuthorizationView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/13/22.
//

import SwiftUI

struct AuthorizationView: View {
    @State var email: String = ""
    @State var password: String = ""
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
                    AuthTextField(isSecure: false, text: $email, placeholder: Constants.emailPlaceholder)
                    AuthTextField(isSecure: true, text: $password, placeholder: Constants.passwordPlaceholder)
                }
                Spacer()
                VStack(alignment: .leading) {
                    BoldButton(title: Constants.signInTitle, action: {})
                    Button(Constants.registerTitle, action: {})
                        .foregroundColor(Color.white)
                        .font(Font.alegreyaSansRegular(size: 20))
                    BoldButton(title: Constants.profilePlaceholder, action: {})
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            
        }
    }
    private enum Constants {
        static let signInTitle = "Sign In"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let registerTitle = "Register"
        static let profilePlaceholder = "Profile"
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
