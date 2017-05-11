//
//  UIImage_Crop.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-20.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public func crop(to rect: CGRect) -> UIImage? {
        guard let img = cgImage?.cropping(to: rect)! else { return nil }
        return UIImage(cgImage: img, scale: scale, orientation: imageOrientation)
    }
}
