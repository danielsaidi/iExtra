//
//  UIButton_BackgroundColor.swift//
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-20.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func setBackgroundColor(_ color: UIColor, forState state: UIControlState) {
        guard let image = imageWithColor(color) else { return }
        self.setBackgroundImage(image, for: state)
    }
    
    
    fileprivate func imageWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
