//
//  PlayerView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/24/22.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    @StateObject var viewModel: DashboardViewModel
    var body: some View {
        ZStack {
            Image.Backgrounds.jungles
                .resizable()
                .ignoresSafeArea()
            VStack {
                Emotion.focused.icon
                    .foregroundColor(Color.grannySmith)
                HStack {
                    Button(action: { viewModel.previousSong() }) {
                        Image(systemName: "backward.end.fill")
                            .imageScale(.large)
                    }
                    Button(action: {
                        viewModel.stop()
                            
                    }) {
                        Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                            .imageScale(.large)
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                    
                    Button(action: { viewModel.nextSong() }) {
                        Image(systemName: "forward.end.fill")
                            .imageScale(.large)
                    }
                }
                .foregroundColor(Color.grannySmith)
            }
        }

    }
}

