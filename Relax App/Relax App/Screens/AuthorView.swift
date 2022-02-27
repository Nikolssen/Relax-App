//
//  AuthorView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/27/22.
//

import SwiftUI

struct AuthorView: View {
    var body: some View {
        ZStack {
            Color.outerSpace
                .ignoresSafeArea()
        VStack {
        Text("Lab 3")
        Text("Budovich Ivan, group 951002")
        Text("BSUIR")
        }
        .font(.alegreyaSansMedium(size: 30))
        .foregroundColor(.white)
    }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}
