//
//  NootNootController.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 18/02/2018.
//  Copyright © 2018 Arnaud Le Bourblanc. All rights reserved.
//

import Foundation
import AVFoundation

class NootNootController: NSObject {

    private var randomizerTimer: Timer?
    private lazy var nootNootPlayer: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "noot", withExtension: "mp3") else {
            return nil
        }
        let player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
        return player
    }()

    func playNootNoot() {
        guard let nootNootPlayer = nootNootPlayer else {
            return
        }

        if nootNootPlayer.isPlaying {
            nootNootPlayer.pause()
            nootNootPlayer.currentTime = 0
            nootNootPlayer.play()
        } else {
            nootNootPlayer.play()
        }
    }

    func beginTheRandomizer() {
        setTimer()
    }

    func setTimer() {
        let randomTime = Double.random(in: 60..<600)
        randomizerTimer = Timer.scheduledTimer(withTimeInterval: randomTime, repeats: false, block: { _ in
            self.playNootNoot()
            self.setTimer()
        })
    }

    func stopTheRandomizer() {
        randomizerTimer?.invalidate()
        randomizerTimer = nil
    }
}
