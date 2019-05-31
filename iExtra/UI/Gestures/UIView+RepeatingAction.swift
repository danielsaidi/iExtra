//
//  UIView+RepeatingAction.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-05-30.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//
//  Reference: https://medium.com/@sdrzn/adding-gesture-recognizers-with-closures-instead-of-selectors-9fb3e09a8f0b
//

/*
 
 This extension applies repeating gesture recognizers, using
 action blocks instead of a target and a selector.
 
 */

import UIKit

public extension UIView {
    
    typealias RepeatingAction = (() -> Void)
    
    func addRepeatingAction(
        initialDelay: TimeInterval = 0.8,
        repeatInterval: TimeInterval = 0.1,
        action: @escaping RepeatingAction) {
        isUserInteractionEnabled = true
        let recognizer = RepeatingGestureRecognizer(
            initialDelay: initialDelay,
            repeatInterval: repeatInterval,
            action: action)
        addGestureRecognizer(recognizer)
    }
    
    func removeRepeatingAction() {
        gestureRecognizers?
            .filter { $0 is RepeatingGestureRecognizer }
            .forEach { removeGestureRecognizer($0) }
    }
}
