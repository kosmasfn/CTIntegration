//
//  PlayMusicView.swift
//  cttest
//
//  Created by Kosmas Ndruru on 17/03/24.
//

import SwiftUI
import AVKit

struct PlayMusicView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    var body: some View{
        ZStack {
            VStack {
                Text("Play").font(.system(size: 40)).font(.largeTitle)
                HStack {
                    Spacer()
                    Button(action: {
                        self.audioPlayer.play()
                    }) {
                        Image(systemName: "play.circle.fill").resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        self.audioPlayer.pause()
                    }) {
                        Image(systemName: "pause.circle.fill").resizable()
                            .frame(width: 40, height: 40)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

#Preview {
    PlayMusicView()
}
