//
//  UserView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/16/22.
//

import SwiftUI

struct UserView: View {

    @StateObject var viewModel: DashboardViewModel
    @State var showSheet: Bool = false
    @State var showPicker: Bool = false
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 5) {
                
                if let image = viewModel.user.image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                            .onTapGesture {
                                showSheet = true
                            }
                            .sheet(isPresented: $showSheet) {
                                ImagePicker(selectedImage: $viewModel.userImage)
                            }
                    }
                    else {
                        Color.gray
                            .frame(width: 150, height: 150, alignment: .center)
                            .clipShape(Circle())
                            .onTapGesture {
                                showSheet = true
                            }
                            .sheet(isPresented: $showSheet) {
                                ImagePicker(selectedImage: $viewModel.userImage)
                            }
                    }
                    
                
                Text(viewModel.name)
                    .foregroundColor(.white)
                    .font(.alegreyaMedium(size: 35))
                ScrollView {
                HStack(alignment: .top) {
                    Moodlet(mood: viewModel.sign, isSelected: false)
                    VStack {
                        Text("This horoscope is for you today:")
                        Text(viewModel.forecast ?? "")
                    }
                    .foregroundColor(.white)
                    .font(.alegreyaSansMedium(size: 20))

                }
                
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 40)),
                    GridItem(.flexible(minimum: 40))], alignment: .center, spacing: 30, pinnedViews: []) {
                        ForEach(viewModel.user.images, id: \.1) {
                            ImageCell(image: Image(uiImage: $0.0), description: $0.1.time)
                        }
                        ImageAdditionCell()
                            .onTapGesture {
                               showPicker = true
                            }
                            .sheet(isPresented: $showPicker) {
                                ImagePicker(selectedImage: $viewModel.newImage)
                            }
                    }
                    .padding(.horizontal, 10)
                }
            }
            
            
        }
    }
}
