//
//  ImageAdditionCell.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/24/22.
//

import SwiftUI

struct ImageAdditionCell: View {
    var body: some View {
        ZStack {
            Color.grannySmith
            Text("+")
                .foregroundColor(.white)
                .font(.alegreyaSansMedium(size: 60))
        }
        .frame(maxHeight: 130, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .aspectRatio(115/153, contentMode: .fit)
    }
}

struct AddImageCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageAdditionCell()
    }
}
