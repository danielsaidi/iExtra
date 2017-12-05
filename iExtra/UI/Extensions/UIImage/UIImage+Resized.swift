//
//  UIImage+Resized.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public func resized(toHeight points: CGFloat) -> UIImage? {
        let height = points * scale
        let ratio = height / size.height
        let width = size.width * ratio
        let newSize = CGSize(width: width, height: height)
        return resized(toSize: newSize)
    }
    
    public func resized(toSize newSize:CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    public func resized(toWidth points: CGFloat) -> UIImage? {
        let width = points * scale
        let ratio = width / size.width
        let height = size.height * ratio
        let newSize = CGSize(width: width, height: height)
        return resized(toSize: newSize)
    }
}
