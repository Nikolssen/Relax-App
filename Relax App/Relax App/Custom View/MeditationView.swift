//
//  MeditationView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/16/22.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        ZStack {
            Color.springWood
            HStack {
            VStack {
                Text("Some title")
                    .font(.alegreyaMedium(size: 25))
                Text("Some long long long description")
                    .font(.alegreyaSansMedium(size: 14))
                Button("More...", action: {})
            }
            }
        }
        
        
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
