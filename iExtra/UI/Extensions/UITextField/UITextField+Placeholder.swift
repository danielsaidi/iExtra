//
//  UITextField_Placeholder.swift
//  Lunchrrrrr
//
//  Created by Daniel Saidi on 2017-02-19.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITextField {
    
    func setPlaceholder(_ text: String, withColor color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: color])
    }
}
