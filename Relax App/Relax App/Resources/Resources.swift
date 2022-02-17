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
    
    static var springWood: Color {
        Color("Spring Wood")
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
    
    static var springWood: UIColor {
        UIColor(named: "Spring Wood")!
    }
}

extension Image {
    enum Signs {
        static var aries: Image {
            Image("Aries")
        }
        static var taurus: Image {
            Image("Taurus")
        }
        
        static var gemini: Image {
            Image("Gemini")
        }
        static var cancer: Image {
            Image("Cancer")
        }
        static var leo: Image {
            Image("Leo")
        }
        static var virgo: Image {
            Image("Virgo")
        }
        static var libra: Image {
            Image("Libra")
        }
        static var scorpio: Image {
            Image("Scorpio")
        }
        static var sagittarius: Image {
            Image("Sagittarius")
        }
        static var capricorn: Image {
            Image("Capricorn")
        }
        static var aquarius: Image {
            Image("Aquarius")
        }
        static var pisces: Image {
            Image("Pisces")
        }
    }
    
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
        
        static var whirl: Image {
            Image("whirl")
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
