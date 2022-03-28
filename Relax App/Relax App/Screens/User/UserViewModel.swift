//
//  UserViewModel.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/28/22.
//

import SwiftUI

final class UserViewModel: ObservableObject {
    var name: String {
        user.name
    }
    
    var sign: HoroscopeSign {
        user.sign
    }
    
    var user: User
    
    var forecast: String?
    let service: Service
    
    init(user: User, service: Service) {
        self.user = user
        self.service = service
        
        Task {
            let forecast = await service.networkService.forecast(sign: sign)
            await MainActor.run {
                self.forecast = forecast?.description
            }
        }
        
    }
}
