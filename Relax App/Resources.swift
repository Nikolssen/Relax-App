//
//  Resources.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/13/22.
//

import Foundation
import UIKit
import SwiftUI

extension Font {
    func piazzollaLight(size: CGFloat) -> Font {
        Font.custom("Piazzolla-Light", size: size)
    }
    
    func piazzollaMedium(size: CGFloat) -> Font {
        Font.custom("Piazzolla-Medium", size: size)
    }
}

extension Color {
    var moss: Color {
        Color("moss")
    }
}

extension UIColor {
    var moss: UIColor {
        UIColor(named: "moss")!
    }
}

extension Image {
    
}
