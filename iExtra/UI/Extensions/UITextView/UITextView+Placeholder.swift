//
//  UITextView+Placeholder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-10-31.
//

import UIKit

public extension UITextView {
    
    public func setupPlaceholder(text: String, color: UIColor = .lightGray) {
        guard self.text.isEmpty else { return }
        self.text = text
        self.textColor = color
    }
    
    public func setupPlaceholderAfterEditing(text: String, color: UIColor = .lightGray) {
        setupPlaceholder(text: text, color: color)
    }
    
    public func setupPlaceholderBeforeEditing(textColor: UIColor = .black, placeholderColor: UIColor = .lightGray) {
        guard self.textColor == placeholderColor else { return }
        self.text = ""
        self.textColor = textColor
    }
}
