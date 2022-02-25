//
//  RegistrationView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/25/22.
//

import SwiftUI

struct RegistrationView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var date: Date = Date()
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
                    AuthTextField(isSecure: false, text: $email, placeholder: Constants.emailPlaceholder)
                    AuthTextField(isSecure: true, text: $password, placeholder: Constants.passwordPlaceholder)
                    AuthTextField(isSecure: false, text: $name, placeholder: "Name")
                    DatePicker("Birth Date", selection: $date, displayedComponents: .date)
                        .font(Font.alegreyaMedium(size: 20))
                        .foregroundColor(Color.white)
                        .accentColor(.white)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    BoldButton(title: Constants.registerTitle, action: {})
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
            
        }
    }
    private enum Constants {
        static let registration = "Register"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let registerTitle = "Register"
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
