//
//  HealthView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/27/22.
//

import SwiftUI

struct HealthView: View {

    @StateObject var viewModel: DashboardViewModel
    var body: some View {
        ZStack {
            Color.outerSpace
                .ignoresSafeArea()
            VStack {
                Text("Calculate your body mass index")
                    .font(.alegreyaMedium(size: 25))
                    .foregroundColor(.white)
                Spacer()
                AuthTextField(isSecure: false, text: $viewModel.height, placeholder: "Height in cm")
                    .keyboardType(.numberPad)
                AuthTextField(isSecure: false, text: $viewModel.weight, placeholder: "Weight in kg")
                
                Button("Calculate", action: { viewModel.calculateBMI() })
                    .font(.alegreyaSansRegular(size: 20))
                    .foregroundColor(.grannySmith)
               
                Text(viewModel.bmi)
                    .foregroundColor(.white)
                    .font(.alegreyaMedium(size: 20))
                Spacer()
            }
            .alert(isPresented: $viewModel.showHealthError) {
                Alert(title: Text("Warning!"), message: Text("Check your data format. It must not be negative or contain extra characters"), dismissButton: .default(Text("Ok")))
            }
            .padding()
        }
        .ignoresSafeArea(.keyboard)
    }
}


