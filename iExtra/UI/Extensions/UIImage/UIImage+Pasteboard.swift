//
//  UIColor+Copy.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-02-01.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension can be used to copy images to the pasteboard.
 
 */

import UIKit

public extension UIImage {
    
    public func copyToPasteboard() -> Bool {
        guard
            let image = badged(withBackgroundColor: .white),
            let data = UIImagePNGRepresentation(image)
            else { return false }
        let pasteBoard = UIPasteboard.general
        pasteBoard.setData(data, forPasteboardType: "public.png")
        return true
    }
}
