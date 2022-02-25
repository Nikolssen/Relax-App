//
//  HoroscopeSign.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/17/22.
//

import SwiftUI

enum HoroscopeSign: Int, MoodletRepresentable, CaseIterable, Identifiable {
    
    case aries
    case taurus
    case gemini
    case cancer
    case leo
    case virgo
    case libra
    case scorpio
    case sagittarius
    case capricorn
    case aquarius
    case pisces
    
    var icon: Image {
        switch self {
        case .aries:
            return Image.Signs.aries
        case .taurus:
            return Image.Signs.taurus
        case .gemini:
            return Image.Signs.gemini
        case .cancer:
            return Image.Signs.cancer
        case .leo:
            return Image.Signs.leo
        case .virgo:
            return Image.Signs.virgo
        case .libra:
            return Image.Signs.libra
        case .scorpio:
            return Image.Signs.scorpio
        case .sagittarius:
            return Image.Signs.sagittarius
        case .capricorn:
            return Image.Signs.capricorn
        case .aquarius:
            return Image.Signs.aquarius
        case .pisces:
            return Image.Signs.pisces
        }
    }
    
    var description: String {
        switch self {
        case .aries:
            return "Aries"
        case .taurus:
            return "Taurus"
        case .gemini:
            return "Gemini"
        case .cancer:
            return "Cancer"
        case .leo:
            return "Leo"
        case .virgo:
            return "Virgo"
        case .libra:
            return "Libra"
        case .scorpio:
            return "Scorpio"
        case .sagittarius:
            return "Sagittarius"
        case .capricorn:
            return "Capricorn"
        case .aquarius:
            return "Aquarius"
        case .pisces:
            return "Pisces"
        }
    }
    
    var id: Int {
        self.rawValue
    }
    
}

extension Date {
    var zodiacSign: HoroscopeSign {
        get {
            let calendar = Calendar.current
            let day = calendar.component(.day, from: self)
            let month = calendar.component(.month, from: self)
            
            switch (day, month) {
            case (21...31, 1), (1...19, 2):
                return .aquarius
            case (20...29, 2), (1...20, 3):
                return .pisces
            case (21...31, 3), (1...20, 4):
                return .aries
            case (21...30, 4), (1...21, 5):
                return .taurus
            case (22...31, 5), (1...21, 6):
                return .gemini
            case (22...30, 6), (1...22, 7):
                return .cancer
            case (23...31, 7), (1...22, 8):
                return .leo
            case (23...31, 8), (1...23, 9):
                return .virgo
            case (24...30, 9), (1...23, 10):
                return .libra
            case (24...31, 10), (1...22, 11):
                return .scorpio
            case (23...30, 11), (1...21, 12):
                return .sagittarius
            default:
                return .capricorn
            }
        }
    }
}
