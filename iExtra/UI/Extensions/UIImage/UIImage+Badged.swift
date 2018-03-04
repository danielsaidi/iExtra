//
//  UIImage+BackgroundColor.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-02-01.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension will draw an image on top of a colored badge.
 It is used by KeyboardKit to ensure that emoji imagess with
 a transparent background are properly exported.
 
 */

import UIKit

public extension UIImage {
    
    public func badged(withBackgroundColor color: UIColor, cornerRadius: CGFloat = 0) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        context?.addPath(path)
        context?.setFillColor(color.cgColor)
        context?.closePath()
        context?.fillPath()
        
        draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

