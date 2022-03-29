//
//  GuideView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/27/22.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        TabView {

            AuthorView()
                .tag(4)
        }
        .tabViewStyle(.page)
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
