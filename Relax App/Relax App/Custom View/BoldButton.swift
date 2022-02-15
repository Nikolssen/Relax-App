//
//  BoldButton.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/13/22.
//

import SwiftUI

struct BoldButton: View {
    var title: String
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            Text(title)
                .tracking(4)
                .font(Font.alegreyaSansMedium(size: 25))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 75, alignment: .center)
        }
        .background(Color.grannySmith.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct BolButton_Previews: PreviewProvider {
    static var previews: some View {
        BoldButton(title: "Text")
    }
}
