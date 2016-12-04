//
//  UIImage_Combine.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-19.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public func combined(with image: UIImage) -> UIImage {

        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let bottomRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        draw(in: bottomRect)
        
        let topSize = image.size
        let topSizeHeightDiff = size.height - topSize.height
        let topSizeWidthDiff = size.width - topSize.width
        let topRect = bottomRect.insetBy(dx: topSizeHeightDiff / 2, dy: topSizeWidthDiff / 2)
        image.draw(in: topRect, blendMode: .normal, alpha: 1)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result ?? UIImage()
    }
}
