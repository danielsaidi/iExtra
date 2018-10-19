//
//  UIView+ActionTapGesture.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//
//  Reference: https://medium.com/@sdrzn/adding-gesture-recognizers-with-closures-instead-of-selectors-9fb3e09a8f0b
//

import UIKit

public extension UIView {
    
    typealias TapAction = ((UITapGestureRecognizer) -> ())
    
    func addTapGestureRecognizer(action: TapAction?) {
        tapAction = action
        isUserInteractionEnabled = true
        let selector = #selector(handleTap)
        let recognizer = UITapGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(recognizer)
    }
}


private extension UIView {
    
    struct Key { static var id = "tapAction" }
    
    var tapAction: TapAction? {
        get {
            return objc_getAssociatedObject(self, &Key.id) as? TapAction
        }
        set {
            guard let value = newValue else { return }
            let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            objc_setAssociatedObject(self, &Key.id, value, policy)
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        tapAction?(sender)
    }
}
