//
//  UIView+Gestures.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-10-08.
//

import UIKit

public extension UIView {
    
    public func addLongPressAction(_ action: Selector, target: Any) {
        let gesture = UILongPressGestureRecognizer(target: target, action: action)
        addGestureRecognizer(gesture)
    }
    
    public func addTapAction(_ action: Selector, target: Any) {
        let gesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(gesture)
    }
}
