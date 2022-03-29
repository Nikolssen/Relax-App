//
//  AuthorizationViewModel.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/26/22.
//

import Foundation
import SwiftUI

class AuthorizationViewModel: ObservableObject {
    var service: Service
    var coordinator: Coordinator
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showSpinner: Bool = false
    @Published var showAlert: Bool = false
    var alertMessage: String = ""
    init(service: Service, coordinator: Coordinator) {
        self.service = service
        self.coordinator = coordinator
        
    }
    
    func signIn() {
        switch email.isValidEmail {
        case .empty:
            alertMessage = "The email is empty!"
            showAlert = true
            return
        case .invalid:
            alertMessage = "The email is incorrect!"
            showAlert = true
            return
        case .valid: break
        }
        
        switch password.isValidPassword {
        case .empty:
            alertMessage = "The password is empty!"
            showAlert = true
            return
        case .short:
            alertMessage = "The password must contain at least 6 characters!"
            showAlert = true
            return
            default: break
        }
        showSpinner = true
        Task {
            let user = await service.firebaseService.signIn(email: email, password: password)
            guard let user = user else {
                await MainActor.run {
                    showSpinner = false
                    alertMessage = "The user does not exist or password is wrong."
                    showAlert = true
                }
                return
            }
            await MainActor.run {
                showSpinner = false
                coordinator.goToDashboard(with: user)
            }
        }
    }
    
    func goToRegistration() {
        coordinator.goToRegistration()
    }
}
