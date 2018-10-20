//
//  UIImage+Shadow.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 The UIView version of `addDropShadow` is slow if it is used
 on several views.
 
 This one is much faster, since it will create a copy of the
 image with a shadow added to it. However, note that you can
 not rotate such images much, since the shadow will be fixed.
 Use it for performance only.
 
 */

import UIKit

public extension UIImage {
    
    func addDropShadow(withSize shadowSize: CGFloat, opacity: Float) -> UIImage? {
        let width = size.width + 2 * shadowSize
        let height = size.height + 2 * shadowSize
        let newSize = CGSize(width: width, height: height)
        let offset = CGSize(width: shadowSize, height: shadowSize)
        let color = UIColor(red: 0, green: 0, blue: 0, alpha: CGFloat(opacity))
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setShadow(offset: offset, blur: shadowSize, color: color.cgColor)
        draw(at: CGPoint(x: shadowSize, y: shadowSize))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
}
