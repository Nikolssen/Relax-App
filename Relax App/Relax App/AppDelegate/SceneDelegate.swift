//
//  SceneDelegate.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/3/22.
//

import UIKit
import SwiftUI
import Firebase
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        Firebase.FirebaseApp.configure()
        self.coordinator = Coordinator(window: window)
        self.window = window
        window.makeKeyAndVisible()
    }
}

