//
//  UITextView+Placeholder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-10-31.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 WHen using this, call `setupPlaceholder` at any time to set
 a placeholder. This is only applied if the text view has no
 text. Call `setupPlaceholderForEditing` when a user will be
 editing the text view. This clears the text and applies the
 color if needed. Call `setupPlaceholderForEditing` when the
 user has finished editing. This restores the placeholder if
 the text view has no text.
 
 */

import UIKit

public extension UITextView {
    
    func setupPlaceholder(text: String, color: UIColor = .lightGray) {
        guard self.text.isEmpty else { return }
        self.text = text
        self.textColor = color
    }
    
    func setupPlaceholderAfterEditing(text: String, color: UIColor = .lightGray) {
        setupPlaceholder(text: text, color: color)
    }
    
    func setupPlaceholderForEditing(textColor: UIColor = .black, placeholderColor: UIColor = .lightGray) {
        guard self.textColor == placeholderColor else { return }
        self.text = ""
        self.textColor = textColor
    }
}
