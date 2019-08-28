//
//  NootNootManager.swift
//  NootNootBar
//
//  Created by Arnaud Le Bourblanc on 18/02/2018.
//  Copyright © 2018 Arnaud Le Bourblanc. All rights reserved.
//

import Foundation
import AVFoundation

class NootNootManager {

    static let shared = NootNootManager()
    private lazy var nootNootPlayer: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "noot", withExtension: "mp3") else {
            return nil
        }
        let player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
        return player
    }()

    private init() {}

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
}
