//
//  UIImage+AverageColor.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-06-13.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIImage {
    
    func calculateAverageColor(fallback: UIColor = .gray) -> UIColor {
        var bitmap = getBitmap()
        let context = CIContext()
        guard let inputImage = getCIImage() else { return fallback }
        let extent = inputImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        let params = [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent]
        guard
            let filter = CIFilter(name: "CIAreaAverage", withInputParameters: params),
            let outputImage = filter.outputImage
            else { return fallback }
        let outputExtent = outputImage.extent
        assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)
        let bounds = CGRect(x: 0, y: 0, width: 1, height: 1)
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: bounds, format: kCIFormatRGBA8, colorSpace: colorSpace)
        return color(from: bitmap)
    }
}


fileprivate extension UIImage {
    
    var colorSpace: CGColorSpace {
        return CGColorSpaceCreateDeviceRGB()
    }
    
    func getBitmap() -> [UInt8] {
        return [UInt8](repeating: 0, count: 4)
    }
    
    func getCIImage() -> CIImage? {
        if let ciImage = ciImage { return ciImage }
        guard let cgImage = cgImage else { return nil }
        return CoreImage.CIImage(cgImage: cgImage)
    }
    
    func color(from bitmap: [UInt8]) -> UIColor {
        return UIColor(
            red: CGFloat(bitmap[0]) / 255.0,
            green: CGFloat(bitmap[1]) / 255.0,
            blue: CGFloat(bitmap[2]) / 255.0,
            alpha: CGFloat(bitmap[3]) / 255.0
        )
    }
}
