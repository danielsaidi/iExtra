//
//  UIColor_Hex.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-22.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIColor {
    
    
    // MARK: - Initialization
    
    public convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xff) / 255
        let green = CGFloat((hex >> 08) & 0xff) / 255
        let blue = CGFloat((hex >> 00) & 0xff) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hexString hex: String) {
        var hex = hex
        if (hex.hasPrefix("#")) {
            let index = hex.characters.index(hex.startIndex, offsetBy: 1)
            hex = hex.substring(from: index)
        }
        
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.characters.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                break
            }
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    
    // MARK: - Public Properties
    
    public var hexString: String {
        return hexString(withAlpha: false)
    }
    
    
    
    // MARK: - Public Functions
    
    public func hexString(withAlpha: Bool) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let red = Int(r * 255)
        let green = Int(g * 255)
        let blue = Int(b * 255)
        let alpha = Int(a * 255)
        
        let alphaFormat = "#%02X%02X%02X%02X"
        let nonAlphaFormat = "#%02X%02X%02X"
        
        return withAlpha
            ? String(format: alphaFormat, red, green, blue, alpha)
            : String(format: nonAlphaFormat, red, green, blue)
    }
}


// MARK: - Private Functions

fileprivate extension UIColor {
    
    func removeHash(in string: String) -> String {
        guard string.hasPrefix("#") else { return string }
        let index = string.characters.index(string.startIndex, offsetBy: 1)
        return string.substring(from: index)
    }
}
