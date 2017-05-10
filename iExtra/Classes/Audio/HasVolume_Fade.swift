//
//  AVAudioPlayer_Fade.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-07.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import AVFoundation


// MARK: - HasVolume

public protocol HasVolume: class {
    
    var volume: Float { get set }
    
}

extension AVAudioPlayer: HasVolume {}

extension AVPlayer: HasVolume { }



// MARK: - Public Functions

public extension HasVolume {
    
    public func fadeVolume(to: Double, duration: Double) {
        fadeVolume(to: to, duration: duration) {}
    }
    
    public func fadeVolume(to: Double, duration: Double, completion: @escaping () -> ()) {
        let from = Double(volume)
        guard to != from, to >= 0, from >= 0 else { return completion() }
        let delta = interval * (to - from) / duration
        fade(to: to, from: from, with: delta, completion: completion)
    }
}


// MARK: - Private Functions

fileprivate extension HasVolume {
    
    var interval: Double { return 0.1 }
    
    func fade(to: Double, from: Double, with delta: Double, completion: @escaping () -> ()) {
        let fadingOut = to < from
        volume += Float(delta)
        let current = Double(volume)
        
        let done = fadingOut ? current <= to : current >= to
        if done { return completion() }
        
        delay(interval) {
            self.fade(to: to, from: from, with: delta, completion: completion)
        }
    }
}
