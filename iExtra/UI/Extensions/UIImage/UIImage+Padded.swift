//
//  UIImage+Padded.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-16.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIImage {

    func padded(toSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let bottomRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let topSize = self.size
        let topSizeHeightDiff = size.height - topSize.height
        let topSizeWidthDiff = size.width - topSize.width
        let topRect = bottomRect.insetBy(dx: topSizeHeightDiff / 2, dy: topSizeWidthDiff / 2)
        draw(in: topRect, blendMode: .normal, alpha: 1)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result ?? UIImage()
    }
}
