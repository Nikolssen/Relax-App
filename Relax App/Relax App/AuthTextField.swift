//
//  AuthTextField.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/12/22.
//

import SwiftUI

struct AuthTextField: View {
    @Binding var text: String
    var placeholder: String
    var body: some View {
        HStack {
            PackedTextField(text: $text, placeholder: placeholder)
                .foregroundColor(.sanMarino)
                .font(.gnuolane(size: 26))
                .accentColor(.sanMarino)
        }
        .padding()
        
        
    }
}


struct PackedTextField: View {
    @Binding var text: String
    var placeholder: LocalizedStringKey
    
    var body: some View {
        if #available(iOS 15.0, *) {
            TextField(placeholder, text: $text, prompt: Text(placeholder))
        } else {
            TextField(placeholder, text: $text)
        }
    }
}
struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(text: .constant("Hello"), placeholder: "Password")
    }
}
