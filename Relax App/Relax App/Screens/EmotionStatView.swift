//
//  EmotionStatView.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/29/22.
//

import SwiftUI

struct EmotionStatView: View {
    @StateObject var viewModel: DashboardViewModel
    
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            if viewModel.emotions.isEmpty {
                Text("There are no emotion stats yet")
                    .foregroundColor(.white)
                    .font(.alegreyaSansRegular(size: 20))
            }
            else {
                VStack{
                    BarChartView(data: viewModel.emotions.map { $0.0 }, colors: [.grannySmith, .silverSand])
                        .frame(maxWidth: 350,  maxHeight: 350, alignment: .center)
                    Text("Your emotions:")
                        .foregroundColor(.white)
                        .font(.alegreyaSansRegular(size: 20))
                    ScrollView {
                        LazyHGrid(rows: [.init(.flexible(minimum: 50, maximum: 100))]) {
                            ForEach(viewModel.emotions, id: \.1) { value in
                                VStack {
                                    Moodlet(mood: value.1, isSelected: false)
                                    Text(String(Int(value.0)))
                                        .foregroundColor(.white)
                                        .font(.alegreyaSansRegular(size: 20))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}
