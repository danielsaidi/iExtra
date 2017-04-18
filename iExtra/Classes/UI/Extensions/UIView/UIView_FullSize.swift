//
//  UIView_FullSize.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    @available(*, deprecated, message: "Use addSubview(_:fill) instead")
    public func makeFullSize(in view: UIView) {
        let width = getConstraint(for: .width, in: view)
        let height = getConstraint(for: .height, in: view)
        let centerX = getConstraint(for: .centerX, in: view)
        let centerY = getConstraint(for: .centerY, in: view)
        NSLayoutConstraint.activate([width, height, centerX, centerY])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func getConstraint(for attr: NSLayoutAttribute, in view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: attr, relatedBy: .equal, toItem: view, attribute: attr, multiplier: 1, constant: 0)
    }
}
