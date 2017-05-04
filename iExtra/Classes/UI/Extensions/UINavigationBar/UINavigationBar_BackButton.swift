//
//  UINavigationBar_BackButton.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-05-04.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public func setBackButtonImage(_ image: UIImage?, bottomInset: CGFloat) {
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: -bottomInset, right: 0)
        let image = image?.withAlignmentRectInsets(insets)
        backIndicatorImage = image
        backIndicatorTransitionMaskImage = image
    }
}
