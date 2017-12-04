//
//  UIView+ScaleFrame.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func scaleFrame(withFactor factor: Float) {
        scaleFrame(withFactor: CGFloat(factor), seconds: 0, options: .curveLinear, completion: nil)
    }
    
    public func scaleFrame(withFactor factor: CGFloat, seconds: TimeInterval, options: UIViewAnimationOptions, completion: ((_ finished: Bool) -> ())?) {
        let size = frame.size
        let newCenter = center
        let newWidth = size.width * factor
        let newHeight = size.height * factor
        let newFrame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        
        let anims = {
            self.frame = newFrame
            self.center = newCenter
        }
        
        UIView.animate(withDuration: seconds, delay: 0, options: options, animations: anims, completion: completion)
    }
}
