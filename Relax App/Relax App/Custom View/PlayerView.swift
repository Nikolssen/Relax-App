//
//  PlayerView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/24/22.
//

import SwiftUI
import AVKit

struct PlayerView: View {
   // @State var player: AVAudioPlayer
    @State var isPlaying = true
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack {
                Emotion.focused.icon
                    .foregroundColor(Color.grannySmith)
                HStack {
                    Button(action: {}) {
                        Image(systemName: "backward.end.fill")
                            .imageScale(.large)
                    }
                    Button(action: {
                        if isPlaying {
                      //      player.pause()
                        }
                        else {
                        //    player.play()
                        }
                        isPlaying.toggle()
                            
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .imageScale(.large)
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "forward.end.fill")
                            .imageScale(.large)
                    }
                }
                .foregroundColor(Color.grannySmith)
            }
        }
//        .onAppear {
//            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
//            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//        }
    }
}

//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView()
//    }
//}
