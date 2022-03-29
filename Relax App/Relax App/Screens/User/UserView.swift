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
    @State var showLookImage: Bool = false
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 5) {
                
                if let image = viewModel.user.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
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
                        .font(.alegreyaSansRegular(size: 18))
                        
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 40)),
                                        GridItem(.flexible(minimum: 40))], alignment: .center, spacing: 30, pinnedViews: []) {
                        ForEach(viewModel.user.images, id: \.1) { image in
                            ImageCell(image: Image(uiImage: image.0), description: image.1.time)
                                .onTapGesture {
                                    viewModel.lookImage = Image(uiImage: image.0)
                                    showLookImage = true
                                    viewModel.deleteReference = image.2
                                }
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
        .overlay(ImageViewer(image: $viewModel.lookImage, viewerShown: $showLookImage, deleteAction: {
            viewModel.deleteImage()
            
        }))
    }
}
