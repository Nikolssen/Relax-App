//
//  SceneDelegate.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/3/22.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let viewController = UIHostingController<OnboardingView>(rootView: .init())
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}

