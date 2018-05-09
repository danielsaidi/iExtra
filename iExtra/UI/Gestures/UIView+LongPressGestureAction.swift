//
//  UIView+ActionLongPressGesture.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//
//  Reference: https://medium.com/@sdrzn/adding-gesture-recognizers-with-closures-instead-of-selectors-9fb3e09a8f0b
//

/*
 
 This extension applies a long press gesture recognizer to a
 view and uses an action block instead of a target/selector.
 
 */

import UIKit

public extension UIView {
    
    typealias LongPressAction = ((UILongPressGestureRecognizer) -> ())
    
    public func addLongPressGestureRecognizer(action: LongPressAction?) {
        longPressAction = action
        isUserInteractionEnabled = true
        let selector = #selector(handleLongPress)
        let recognizer = UILongPressGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(recognizer)
    }
}

fileprivate extension UIView {
    
    struct Key { static var id = "longPressAction" }
    
    var longPressAction: LongPressAction? {
        get {
            return objc_getAssociatedObject(self, &Key.id) as? LongPressAction
        }
        set {
            guard let value = newValue else { return }
            let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            objc_setAssociatedObject(self, &Key.id, value, policy)
        }
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        guard sender.state == .began else { return }
        longPressAction?(sender)
    }
}
