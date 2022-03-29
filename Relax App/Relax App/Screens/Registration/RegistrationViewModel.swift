//
//  RegistrationViewModel.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/26/22.
//

import SwiftUI

final class RegistrationViewModel: ObservableObject {
    var service: Service
    var coordinator: Coordinator
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var date: Date = Date()
    @Published var showSpinner: Bool = false
    @Published var showAlert: Bool = false
    var alertMessage: String = ""
    
    init(service: Service, coordinator: Coordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func register() {
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
        
        if name.isEmpty {
            alertMessage = "The name is empty!"
            showAlert = true
            return
        }
        
        if date > Date() {
            alertMessage = "The birth date must be in past!"
            showAlert = true
            return
        }
        
        showSpinner = true
        Task {
            let user = await service.firebaseService.register(email: email, password: password, name: name, date: date)
            guard let user = user else {
                await MainActor.run {
                    showSpinner = false
                    alertMessage = "Registration error. Possibly, this account already exists."
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
}
