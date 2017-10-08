//
//  UIView+Gestures.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-10-08.
//

import UIKit

public extension UIView {
    
    @discardableResult
    public func addLongPressAction(_ action: Selector, target: Any) -> UILongPressGestureRecognizer {
        let gesture = UILongPressGestureRecognizer(target: target, action: action)
        addGestureRecognizer(gesture)
        return gesture
    }
    
    @discardableResult
    public func addTapAction(_ action: Selector, target: Any) -> UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(gesture)
        return gesture
    }
}
