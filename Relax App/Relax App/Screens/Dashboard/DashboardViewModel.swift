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
    
}
