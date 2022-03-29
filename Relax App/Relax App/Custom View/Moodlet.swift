//
//  Moodlet.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/15/22.
//

import SwiftUI

struct Moodlet: View {
    let mood: MoodletRepresentable
    let isSelected: Bool
    var body: some View {
        VStack {
            ZStack {
                Color.white
                mood.icon
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                    .foregroundColor(.outerSpace)
                
            }
            .shadow(color: isSelected ? .green : .clear, radius: 10, x: 5, y: 5)
            .frame(width: 64, height: 64, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            Text(mood.description)
                .foregroundColor(.silverSand)
                .font(.alegreyaSansRegular(size: 12))
        }
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.outerSpace
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 15) {
                    ForEach(HoroscopeSign.allCases) {
                        Moodlet(mood: $0, isSelected: false)
                    }
                }
            }
        }
    }
}
