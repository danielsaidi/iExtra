//
//  ExpandedTapAreaButton.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-03-06.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ExpandedTapAreaButton: UIButton {
    
    public var tapPadding: CGFloat = 20
    
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let inset = -tapPadding
        let insets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        let tapBounds = bounds.inset(by: insets)
        return tapBounds.contains(point)
    }
}
