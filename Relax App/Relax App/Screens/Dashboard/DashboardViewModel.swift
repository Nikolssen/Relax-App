//
//  DashboardViewModel.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/28/22.
//

import Foundation
import Combine
import UIKit

class DashboardViewModel: ObservableObject {
    @Published var emotion: Emotion?
    
    var name: String {
        user.name
    }
    var sign: HoroscopeSign {
        user.sign
    }
    
    
    @Published var newImage: UIImage
    @Published var userImage: UIImage
    
    var forecast: String?
    var user: User
    var service: Service
    var cancellables: Set<AnyCancellable> = .init()
    
    init(user: User, service: Service) {
        self.user = user
        self.service = service
        newImage = UIImage()
        userImage = UIImage()
        emotion = user.emotion ?? user.emotions.sorted(by: { $0.0 < $1.0 }).first?.1
        
        $emotion
            .compactMap { $0 }
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                let date = Date()
                self.service.firebaseService.upload(emotion: $0, for: date, for: self.user)
                user.emotion = $0
                user.emotions.append((date, $0))
            })
            .store(in: &cancellables)
        
        $userImage
            .sink(receiveValue: { [weak self] image in
                guard let self = self else { return }
                
                Task {
                    await self.service.firebaseService.update(image: image, user: self.user)
                    
                    await MainActor.run {
                        self.objectWillChange.send()
                    }
                }
            })
            .store(in: &cancellables)
        
        $newImage
            .sink(receiveValue: { [weak self] image in
                guard let self = self else { return }
                Task {
                    await self.service.firebaseService.load(image: image, date: Date(), user: self.user)
                    await MainActor.run {
                        self.objectWillChange.send()
                    }
                }
            })
            .store(in: &cancellables)
        
        Task {
            let forecast = await service.networkService.forecast(sign: sign)
            await MainActor.run {
                self.forecast = forecast?.description
            }
        }
    }
}
