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
