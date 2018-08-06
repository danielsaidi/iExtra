//
//  UIStackView+Subviews.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIStackView {
    
    public func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addArrangedSubview($0)
        }
    }
    
    public func removeArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    public func removeAllArrangedSubviews() {
        removeArrangedSubviews(arrangedSubviews)
    }
}
