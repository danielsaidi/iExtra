//
//  UIView+Copy.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-20.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func createImageCopy() -> UIImage {
        UIGraphicsBeginImageContext(frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    public func createImageSilhouetteCopy() -> UIImage {
        let image = createImageCopy()
        let ciContext = CIContext(options: nil)
        let ciInput = CIImage(cgImage: image.cgImage!)
        let filter = CIFilter(name: "CIFalseColor")
        let color0 = CIColor(red: 0, green: 0, blue: 0, alpha: 1)
        let color1 = CIColor(red: 0, green: 0, blue: 0, alpha: 0)
        filter?.setValue(color0, forKey: "inputColor0")
        filter?.setValue(color1, forKey: "inputColor1")
        filter?.setValue(ciInput, forKey: kCIInputImageKey)
        let outImage = filter?.value(forKey: kCIOutputImageKey) as? CIImage ?? CIImage()
        let result = ciContext.createCGImage(outImage, from: ciInput.extent)
        return UIImage(cgImage: result!)
    }
}
