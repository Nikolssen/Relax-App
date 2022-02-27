//
//  User.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/17/22.
//
import Foundation
import Combine
import SwiftUI

class User: ObservableObject {

    let name: String
    let email: String
    let birthdayDate: Date
    var image: Image?
    var images: [Image]
    lazy var sign: HoroscopeSign = {
        birthdayDate.zodiacSign
    }()
    var emotion: Emotion?
    
    init(name: String, email: String, birthdayDate: Date, image: Image? = nil, images: [Image] = []) {
        self.name = name
        self.email = email
        self.birthdayDate = birthdayDate
        self.image = image
        self.images = images
    }
    
}
