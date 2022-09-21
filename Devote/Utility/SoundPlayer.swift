//
//  SoundPlayer.swift
//  Devote
//
//  Created by Bilal Durnagöl on 20.09.2022.
//

import Foundation
import AVFoundation

// MARK: - Properties

enum SoundType: String {
    case mp3
}

enum Sound: String {
    case ding = "sound-ding"
    case rise = "sound-rise"
    case tap = "sound-tap"
}

var audioPlayer: AVAudioPlayer?

func playSound(sound: Sound, type: SoundType = .mp3) {
    if let path = Bundle.main.path(forResource: sound.rawValue, ofType: type.rawValue) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            debugPrint("Could not find and play the sound file.")
        }
    }
}
