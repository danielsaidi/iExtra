//
//  UIView_AddSubview.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-08.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func addSubview(_ subview: UIView, fill: Bool) {
        guard fill else { return addSubview(subview) }
        subview.frame = bounds
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(subview)
    }
}
