//
//  UIInputViewController+FullAccess.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2018-03-04.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension can be used to check for full access even on
 older iOS versions. Use this instead of `hasFullAccess` and
 you don't have to use `#available`.
 
 */

import UIKit

public extension UIInputViewController {
    
    public var hasFullLegacyAccess: Bool {
        if #available(iOS 11.0, *) { return hasFullAccess }
        if #available(iOS 10.0, *) { return hasFullAccessiOS10 }
        return hasFullAccessiOS9
    }
}


// MARK: - Private Properties

fileprivate extension UIInputViewController {
    
    var hasFullAccessiOS9: Bool {
        var pasteboard: UIPasteboard?
        pasteboard = UIPasteboard.general
        return pasteboard != nil
    }
    
    var hasFullAccessiOS10: Bool {
        if #available(iOS 10.0, *) {
            let pasteboard = UIPasteboard.general
            if pasteboard.hasURLs || pasteboard.hasColors || pasteboard.hasStrings || pasteboard.hasImages {
                return true
            }
            pasteboard.string = "KeyboardKit"
            let fullAccess = pasteboard.hasStrings
            pasteboard.string = ""
            return fullAccess
        }
        return false
    }
}
