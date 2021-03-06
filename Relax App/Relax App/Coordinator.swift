//
//  Coordinator.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/26/22.
//

import UIKit
import SwiftUI

final class Coordinator {
    private var window: UIWindow
    private var service: Service = .init()
    var baseController: UIViewController!
    
    var onBoardingController: UIViewController {
        let onboardingController = UIHostingController<OnboardingView>(rootView: OnboardingView(registrationAction: { [weak self] in
            self?.goToRegistration()
        }, authorizationAction: { [weak self] in
            self?.goToAuthorization()
        }, guideAction: { [weak self] in
            self?.showGuide()
        }))
        return onboardingController
    }
    
    var authorizationController: UIViewController {
        let viewModel = AuthorizationViewModel(service: service, coordinator: self)
        let authorizationController = UIHostingController<AuthorizationView>(rootView: AuthorizationView(viewModel: viewModel))
        return authorizationController
    }
    
    var registrationController: UIViewController {
        let viewModel = RegistrationViewModel(service: service, coordinator: self)
        let registrationController = UIHostingController<RegistrationView>(rootView: RegistrationView(viewModel: viewModel))
        return registrationController
    }
    
    func dashboardController(for user: User) -> UIViewController {
        let dashboardViewModel = DashboardViewModel(user: user, service: service, coordinator: self)
        let dashboardController = UIHostingController<DashboardTabView>(rootView: DashboardTabView(dashboardViewModel: dashboardViewModel))
        return dashboardController
    }
    
    init(window: UIWindow) {
        self.window = window
        let baseController = UINavigationController()
        baseController.setViewControllers([onBoardingController], animated: false)
        self.baseController = baseController
        window.rootViewController = baseController
    }
    
    func goToRegistration() {
        guard let baseController = baseController as? UINavigationController else { return }
        baseController.pushViewController(registrationController, animated: true)
    }
    
    func goToAuthorization() {
        guard let baseController = self.baseController as? UINavigationController else { return }
        baseController.pushViewController(self.authorizationController, animated: true)
    }
    
    func goToDashboard(with user: User) {
        let controller = dashboardController(for: user)
        baseController = controller
        window.rootViewController = controller
    }
    
    func logout() {
        let baseController = UINavigationController()
        baseController.setViewControllers([onBoardingController], animated: false)
        self.baseController = baseController
        window.rootViewController = baseController
    }
    
    func showGuide() {
        let controller = UIHostingController<GuideView>(rootView: GuideView())
        guard let baseController = baseController as? UINavigationController else { return }
        baseController.pushViewController(controller, animated: true)
    }
}
