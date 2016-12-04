//
//  UIAlertController_SourceView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-17.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIAlertController {

    public var sourceView: UIView? {
        get {
            return popoverPresentationController?.sourceView
        }
        set {
            popoverPresentationController?.sourceView = newValue
            popoverPresentationController?.sourceRect = newValue?.bounds ?? CGRect.zero
        }
    }
}
