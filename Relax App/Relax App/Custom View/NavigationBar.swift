//
//  NavigationBar.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/22/22.
//

import SwiftUI

struct NavigationBar: View {
    var exitAction: () -> Void
    var body: some View {
        HStack {
            Image.hamburger
                .resizable()
                .frame(width: 23, height: 23, alignment: .center)
                .foregroundColor(Color.white)
            Spacer()
            Image.Icons.logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48, alignment: .center)
                .foregroundColor(.white)
            Spacer()
            Text("exit")
                .font(.alegreyaMedium(size: 14))
                .foregroundColor(.white)
                .onTapGesture {
                    exitAction()
                }
        }
        .padding(.horizontal)
    }
}

