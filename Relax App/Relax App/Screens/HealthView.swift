//
//  HealthView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/27/22.
//

import SwiftUI

struct HealthView: View {
    var body: some View {
        ZStack {
            Color.outerSpace
                .ignoresSafeArea()
            VStack {
                Text("Calculate your body mass index")
                    .font(.alegreyaMedium(size: 25))
                    .foregroundColor(.white)
                Spacer()
                
            }
        }
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
