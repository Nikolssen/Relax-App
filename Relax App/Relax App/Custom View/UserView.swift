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
            VStack(alignment: .center, spacing: 5) {
                Color.silverSand
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                Text("Emille")
                    .foregroundColor(.white)
                    .font(.alegreyaMedium(size: 35))
                ScrollView {
                HStack(alignment: .top) {
                    Moodlet(mood: HoroscopeSign.pisces, isSelected: false)
                    Text("This horoscope is for you today.")
                        .foregroundColor(.white)
                        .font(.alegreyaSansMedium(size: 20))
                }
                
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
