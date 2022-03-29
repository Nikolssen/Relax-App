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
    init(service: Service, coordinator: Coordinator) {
        self.service = service
        self.coordinator = coordinator
        
    }
    
    func signIn() {
        showSpinner = true
        Task {
            let user = await service.firebaseService.signIn(email: email, password: password)
            guard let user = user else {
                await MainActor.run {
                    showSpinner = false
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
