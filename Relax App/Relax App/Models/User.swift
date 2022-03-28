//
//  User.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/17/22.
//
import Foundation
import Combine
import SwiftUI

//class User: ObservableObject {
//
//    let name: String
//    let email: String
//    let birthdayDate: Date
//    @Published var image: Image?
//    @Published var images: [(Image, String, Date)] = []
//    lazy var sign: HoroscopeSign = {
//        birthdayDate.zodiacSign
//    }()
//    @Published var emotion: Emotion?
//    var emotions: [(Date, Emotion)] = []
//    var height: Float?
//    var weight: Float?
//    
//    init(name: String, email: String, birthdayDate: Date, image: Image? = nil, images: [Image] = []) {
//        self.name = name
//        self.email = email
//        self.birthdayDate = birthdayDate
//        self.image = image
//        //self.images = images
//    }
//    
//}

class User {

    let name: String
    let email: String
    let birthdayDate: Date
    var image: UIImage?
    var images: [(UIImage, Date, String)] = []
    lazy var sign: HoroscopeSign = {
        birthdayDate.zodiacSign
    }()
    var emotion: Emotion?
    var emotions: [(Date, Emotion)] = []
    var height: Float?
    var weight: Float?
    let document: String
    let uid: String
    init(name: String, email: String, birthdayDate: Date, weight: Float?, height: Float?, image: UIImage?, images: [(UIImage, Date, String)], emotions: [(Date, Emotion)], document: String, uid: String) {
        self.name = name
        self.email = email
        self.birthdayDate = birthdayDate
        self.image = image
        self.images = images
        self.height = height
        self.weight = weight
        self.emotions = emotions
        self.document = document
        self.uid = uid
    }
    
}
