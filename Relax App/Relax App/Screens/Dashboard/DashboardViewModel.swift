//
//  DashboardViewModel.swift
//  Relax App
//
//  Created by Ivan Budovich on 3/28/22.
//

import Foundation
import Combine
import UIKit
import AVFAudio

class DashboardViewModel: ObservableObject {
    @Published var emotion: Emotion?
    
    var name: String {
        user.name
    }
    var sign: HoroscopeSign {
        user.sign
    }
    var advice: MeditationAdvice?
    
    @Published var weight: String
    @Published var height: String
    @Published var bmi: String = ""
    @Published var showHealthError: Bool = false
    
    
    @Published var newImage: UIImage
    @Published var userImage: UIImage
    
    var songURLs: [URL] = [URL(fileURLWithPath: Bundle.main.path(forResource: "1.mp3", ofType: nil)!),
                           URL(fileURLWithPath: Bundle.main.path(forResource: "2.mp3", ofType: nil)!),
                           URL(fileURLWithPath: Bundle.main.path(forResource: "3.mp3", ofType: nil)!),
                           URL(fileURLWithPath: Bundle.main.path(forResource: "4.mp3", ofType: nil)!),
    ]
    
    var currentSong: Int = 0
    @Published var isPlaying = false
    var player: AVAudioPlayer?
    
    var forecast: String?
    let user: User
    let service: Service
    let coordinator: Coordinator
    var cancellables: Set<AnyCancellable> = .init()
    
    init(user: User, service: Service, coordinator: Coordinator) {
        self.user = user
        self.service = service
        self.coordinator = coordinator
        self.weight = user.weight?.description ?? ""
        self.height = user.height?.description ?? ""
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
    
    func nextSong() {
        if currentSong == 3 {
            currentSong = 1
        }
        else { currentSong += 1 }
        player?.stop()
        player = try? AVAudioPlayer(contentsOf: songURLs[currentSong])
        player?.play()
        isPlaying = true
    }
    
    func previousSong() {
        if currentSong == 0 {
            currentSong = 3
        } else { currentSong -= 1 }
        player?.stop()
        player = try? AVAudioPlayer(contentsOf: songURLs[currentSong])
        player?.play()
        isPlaying = true
    }
    
    func stop() {
        if let player = player {
            if isPlaying {
                player.pause()
                isPlaying = false
            }
            else {
                player.play()
                isPlaying = true
            }
        }
        else {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                try AVAudioSession.sharedInstance().setActive(true)
            }
            catch {
                
            }

            player = try? AVAudioPlayer(contentsOf: songURLs[currentSong])
            player?.play()
            isPlaying = true
        }
    }
    
    func calculateBMI() {
        if let weight = Float(weight),
           let height = Float(height), weight > 0, height > 0 {
            Task {
                await service.firebaseService.change(height: height, for: user)
                await service.firebaseService.change(weight: weight, for: user)
            }
            let bmi = weight / pow((height / 100), 2)
            self.bmi = (String(bmi)+". " + BMI.status(for: bmi).description)
        }
        else { showHealthError = true }
        
    }
    
    func logout() {
        service.firebaseService.logout()
        coordinator.logout()
    }
    
}

enum BMI {
    case severeThinness
    case moderateThinness
    case mildThinness
    case normal
    case overweight
    case obeseI
    case obeseII
    case obeseIII
    
    static func status(for bmi: Float) -> BMI {
        if bmi < 16 { return .severeThinness }
        if bmi < 17 { return .moderateThinness }
        if bmi < 18.5 { return .mildThinness }
        if bmi < 25 { return .normal }
        if bmi < 30 { return .overweight }
        if bmi < 35 { return .obeseI }
        if bmi < 40 { return .obeseII }
        return .obeseIII
    }
    
    var description: String {
        switch self {
        case .severeThinness:
            return "Underweight (Severe thinness)"
        case .moderateThinness:
            return "Underweight (Moderate thinness)"
        case .mildThinness:
            return "Underweight (Mild thinness)"
        case .normal:
            return "Normal"
        case .overweight:
            return "Overweight (Pre-obese)"
        case .obeseI:
            return "Obese (Class I)"
        case .obeseII:
            return "Obese (Class II)"
        case .obeseIII:
            return "Obese (Class III)"
        }
    }
}
