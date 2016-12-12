//
//  UIImage_Rotated.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//
// Source: http://stackoverflow.com/questions/27092354/rotating-uiimage-in-swift
//

import UIKit

public extension UIImage {
    
    public func rotated(byDegrees degrees: CGFloat) -> UIImage? {
        return rotated(byDegrees: degrees, flipped: false)
    }
    
    public func rotated(byDegrees degrees: CGFloat, flipped flip: Bool) -> UIImage? {
        
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // Calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
        let transform = CGAffineTransform(rotationAngle: degreesToRadians(degrees));
        rotatedViewBox.transform = transform
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin so we will rotate and scale around the center.
        bitmap?.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0);
        
        // Rotate the image context
        bitmap?.rotate(by: degreesToRadians(degrees));
        
        // Draw the rotated/scaled image into the context
        var yFlip: CGFloat
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        bitmap?.scaleBy(x: yFlip, y: -1.0)
        bitmap?.draw(cgImage!, in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
