//
//  ImageCell.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/24/22.
//

import SwiftUI

struct ImageCell: View {
    var image: Image
    var description: String
    var body: some View {
        ZStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack{
                Text(description)
                    .foregroundColor(.white)
                    .font(.alegreyaSansMedium(size: 18))
                    .padding(.top, 60)
                    .padding(.horizontal, 20)
                Spacer()
            }
        }
        .frame(maxHeight: 130, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .aspectRatio(115/153, contentMode: .fit)
    }
}

struct ImageCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageCell(image: Image.Backgrounds.wood, description: "12:12")
    }
}
