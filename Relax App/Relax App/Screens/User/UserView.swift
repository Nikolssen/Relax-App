//
//  UserView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/16/22.
//

import SwiftUI

struct UserView: View {

    @StateObject var viewModel: UserViewModel
    @State var showSheet: Bool = false
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 5) {
                
//                    if let image = user.image {
//                        image
//                            .frame(width: 150, height: 150, alignment: .center)
//                            .clipShape(Circle())
//                            .actionSheet(isPresented: $showSheet, content: {
//                                ActionSheet(title: Text("What would you like to do?"), message: nil, buttons: [
//                                    .default(Text("Delete"), action: {}),
//                                    .default(Text("Add new photo"), action: {}),
//                                    .cancel()])
//                            })
//                    }
//                    else {
//                        Color.gray
//                            .frame(width: 150, height: 150, alignment: .center)
//                            .clipShape(Circle())
//                            .sheet(isPresented: $showSheet) {
//                                ImagePicker(selectedImage: $user.image)
//                            }
//                    }
                    
                
                Text(viewModel.name)
                    .foregroundColor(.white)
                    .font(.alegreyaMedium(size: 35))
                ScrollView {
                HStack(alignment: .top) {
                    Moodlet(mood: viewModel.sign, isSelected: false)
                    Text("This horoscope is for you today.")
                        .foregroundColor(.white)
                        .font(.alegreyaSansMedium(size: 20))
                }
                
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 40)),
                    GridItem(.flexible(minimum: 40))], alignment: .center, spacing: 30, pinnedViews: []) {
                        ForEach(viewModel.user.images, id: \.1) {
                            ImageCell(image: Image(uiImage: $0.0), description: $0.1.time)
                        }
                        ImageAdditionCell()
                    }
                    .padding(.horizontal, 10)
                }
            }
            
            
        }
    }
}
