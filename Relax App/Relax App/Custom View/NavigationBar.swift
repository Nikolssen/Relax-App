//
//  NavigationBar.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/22/22.
//

import SwiftUI

struct NavigationBar: View {
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
            Image.Icons.user
                .resizable()
                .frame(width: 36, height: 36, alignment: .center)
                .clipShape(Circle())
        }
        .padding(.horizontal)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
