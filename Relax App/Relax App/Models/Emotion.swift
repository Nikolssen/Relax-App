//
//  Emotion.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/15/22.
//

import SwiftUI

enum Emotion: Int, MoodletRepresentable, CaseIterable, Identifiable {
   
    case enraged
    case depressed
    case focused
    case relaxed
    case calm
    case worried
    
    var icon: Image {
        switch self {
        case .enraged:
            return Image.Emotions.lightning
        case .depressed:
            return Image.Emotions.drops
        case .focused:
            return Image.Emotions.focus
        case .relaxed:
            return Image.Emotions.relax
        case .calm:
            return Image.Emotions.calm
        case .worried:
            return Image.Emotions.whirl
        }
    }
    
    var description: String {
        switch self {
        case .enraged:
            return "Enraged"
        case .depressed:
            return "Depressed"
        case .focused:
            return "Focused"
        case .relaxed:
            return "Relaxed"
        case .calm:
            return "Calm"
        case .worried:
            return "Worried"
        }
    }
    
    var id: Int {
        self.rawValue
    }
    
    static func value(from string: String) -> Emotion? {
        switch string {
        case "Enraged":
            return .enraged
        case "Depressed":
            return .depressed
        case "Focused":
            return .focused
        case "Relaxed":
            return .relaxed
        case "Calm":
            return .calm
        case "Worried":
            return .worried
        default: return nil
        }
    }
}
