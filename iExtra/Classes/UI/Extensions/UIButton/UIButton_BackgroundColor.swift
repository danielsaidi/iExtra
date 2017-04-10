//
//  UIButton_BackgroundColor.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-20.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func setBackgroundColor(_ color: UIColor, forState state: UIControlState) {
        guard let image = UIImage(color: color) else { return }
        self.setBackgroundImage(image, for: state)
    }
}
