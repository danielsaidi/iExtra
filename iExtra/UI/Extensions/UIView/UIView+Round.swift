//
//  UIView+Round.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func round(bySize size: Int) {
        let oldCenter = center
        let size = CGFloat(size)
        frame.size.height = size
        frame.size.width = size
        layer.cornerRadius = size / 2.0
        center = oldCenter
    }
    
    public func roundByHeight() {
        round(bySize: Int(frame.size.height))
    }
    
    public func roundByWidth() {
        round(bySize: Int(frame.size.width))
    }
}
