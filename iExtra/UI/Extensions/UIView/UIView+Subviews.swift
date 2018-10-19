//
//  UIView+Subviews.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-08.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func addSubview(_ subview: UIView, fill: Bool) {
        guard fill else { return addSubview(subview) }
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public func addSubviewBottommost(_ view: UIView) {
        if subviews.count == 0 {
            addSubview(view)
        } else {
            insertSubview(view, belowSubview: subviews.first!)
        }
    }
    
    public func addSubviewTopmost(_ view: UIView) {
        if subviews.count == 0 {
            addSubview(view)
        } else {
            insertSubview(view, aboveSubview: subviews.last!)
        }
    }
    
    public func removeSubviews(_ views: [UIView]) {
        views.forEach { $0.removeFromSuperview() }
    }
}
