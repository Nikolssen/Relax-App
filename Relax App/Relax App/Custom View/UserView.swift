//
//  UserView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/16/22.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack {
                Color.silverSand
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                Text("Emille")
                    .foregroundColor(.white)
                    .font(.alegreyaMedium(size: 35))
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 40)),
                    GridItem(.flexible(minimum: 40))], alignment: .center, spacing: 30, pinnedViews: []) {
                        ImageCell()
                        ImageCell()
                        ImageCell()
                        ImageCell()
                        ImageAdditionCell()
                    }
                    .padding(.horizontal, 10)
                }
            }
            
            
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
