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
    init(service: Service, coordinator: Coordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func register() {
        
        showSpinner = true
        Task {
            let user = await service.firebaseService.register(email: email, password: password, name: name, date: date)
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
}
