//
//  UIView+Dock.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit


// MARK: - UIViewDockPosition

public enum UIViewDockPosition { case
    topLeft,
    topRight,
    bottomLeft,
    bottomRight
}


// MARK: - Public Functions

public extension UIView {
    
    public func dock(to position: UIViewDockPosition, padding: CGFloat) {
        switch position {
        case .bottomLeft: dockToBottomLeft(with: padding)
        case .bottomRight: dockToBottomRight(with: padding)
        case .topLeft: dockToTopLeft(with: padding)
        case .topRight: dockToTopRight(with: padding)
        }
    }
}


// MARK: - Private Functions

private extension UIView {
    
    func dockToBottomRight(with padding: CGFloat) {
        let x = superview!.frame.size.width - frame.size.width - padding
        let y = superview!.frame.size.height - frame.size.height - padding
        frame.origin = CGPoint(x: x, y: y)
    }
    
    func dockToBottomLeft(with padding: CGFloat) {
        let x = padding
        let y = superview!.frame.size.height - frame.size.height - padding
        frame.origin = CGPoint(x: x, y: y)
    }
    
    func dockToTopLeft(with padding: CGFloat) {
        let x = padding
        let y = padding
        frame.origin = CGPoint(x: x, y: y)
    }
    
    func dockToTopRight(with padding: CGFloat) {
        let x = superview!.frame.size.width - frame.size.width - padding
        let y = padding
        frame.origin = CGPoint(x: x, y: y)
    }
}
