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
    static func alegreyaMedium(size: CGFloat) -> Font {
        Font.custom("Alegreya-Medium", size: size)
    }
    
    static func alegreyaSansMedium(size: CGFloat) -> Font {
        Font.custom("AlegreyaSans-Medium", size: size)
    }
    
    static func alegreyaSansRegular(size: CGFloat) -> Font {
        Font.custom("AlegreyaSans-Regular", size: size)
    }
}

extension Color {
    static var grannySmith: Color {
        Color("Granny Smith")
    }
    
    static var outerSpace: Color {
        Color("Outer Space")
    }
    
    static var silverSand: Color {
        Color("Silver Sand")
    }
}

extension UIColor {
    static var grannySmith: UIColor {
        UIColor(named: "Granny Smith")!
    }
    
    static var outerSpace: UIColor {
        UIColor(named: "Outer Space")!
    }
    
    static var silverSand: UIColor {
        UIColor(named: "Silver Sand")!
    }
}

extension Image {
    enum Emotions {
        static var calm: Image {
            Image("calm")
        }
        static var drops: Image {
            Image("drops")
        }
        static var focus: Image {
            Image("focus")
        }
        static var relax: Image {
            Image("relax")
        }
        
        static var lightning: Image {
            Image("lightning")
        }
    }
    
    enum Icons {
        static var logo: Image {
            Image("logo")
        }
        static var tunes: Image {
            Image("tunes")
        }
        static var user: Image {
            Image("user")
        }
    }
    
    enum Backgrounds {
        static var wood: Image {
            Image("background-woods")
        }
        
        static var jungles: Image {
            Image("background-jungles")
        }
    }
    
    static var hamburger: Image {
        Image("hamburger")
    }
    
    static var lotus: Image {
        Image("lotus")
    }
}