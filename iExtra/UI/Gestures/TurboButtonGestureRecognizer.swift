//
//  TurboButtonGestureRecognizer.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-05-31.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 
 This gesture recognizer will trigger a certain action using
 a suuuuper short initial delay and repeating time interval.
 
 */

import UIKit

open class TurboButtonGestureRecognizer: RepeatingGestureRecognizer {
    
    public override init(
        initialDelay: TimeInterval = 0.01,
        repeatInterval: TimeInterval = 0.01,
        action: @escaping () -> Void) {
        super.init(
            initialDelay: initialDelay,
            repeatInterval: repeatInterval,
            action: action
        )
    }
}
