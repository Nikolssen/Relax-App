//
//  ViewController.swift
//  AuthTextField
//
//  Created by Ivan Budovich on 2/3/22.
//
import SwiftUI
struct AuthTextField: View {
    
    let isSecure: Bool
    @Binding var text: String
    let placeholder: String
    var body: some View {
        VStack {
            PackedTextField(text: $text, placeholder: "", isSecure: isSecure)
                .font(Font.alegreyaSansRegular(size: 18))
                .accentColor(Color.white)
                .foregroundColor(Color.white)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder)
                        .font(Font.alegreyaSansRegular(size: 18))
                        .foregroundColor(Color.silverSand.opacity(0.5))
                }
                .padding(.horizontal, 5)
            Color.silverSand
                .frame(maxWidth: .infinity, maxHeight: 1.4, alignment: .center)
        }
        .padding(.vertical)
    }
    
    
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            AuthTextField(isSecure: false, text: .constant(""), placeholder: "Username")
            AuthTextField(isSecure: true, text: .constant(""), placeholder: "Password")
            
        }
        .background(Color.outerSpace)
        
        
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

struct PackedTextField: View {
    @Binding var text: String
    var placeholder: String
    let isSecure: Bool
    var body: some View {
        if isSecure {
            SecureField("", text: $text)
        }
        else {
            TextField("", text: $text)
        }
    }
}
