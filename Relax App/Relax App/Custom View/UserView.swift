//
//  UserView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/16/22.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var user: User
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 5) {
                
                    if let image = user.image {
                        image
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                    }
                    else {
                        Color.gray
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                    }
                
                Text(user.name)
                    .foregroundColor(.white)
                    .font(.alegreyaMedium(size: 35))
                ScrollView {
                HStack(alignment: .top) {
                    Moodlet(mood: user.sign, isSelected: false)
                    Text("This horoscope is for you today.")
                        .foregroundColor(.white)
                        .font(.alegreyaSansMedium(size: 20))
                }
                
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 40)),
                    GridItem(.flexible(minimum: 40))], alignment: .center, spacing: 30, pinnedViews: []) {
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
            .environmentObject(User(name: "Lakeisha", email: "", birthdayDate: Date(), image: Image.Backgrounds.wood))
    }
}
