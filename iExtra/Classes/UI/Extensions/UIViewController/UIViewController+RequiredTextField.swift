//
//  UIViewController+RequiredTextField.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {

    public func assert(requiredTextField textField: UITextField?) -> Bool {
        guard let textField = textField else { return false }
        guard let text = textField.text else { return false }
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        let hasValue = trimmed.count > 0
        if !hasValue {
            textField.becomeFirstResponder()
        }
        return hasValue
    }
    
    public func assert(requiredTextFields textFields: [UITextField?]) -> Bool {
        for field in textFields {
            if !assert(requiredTextField: field) {
                return false
            }
        }
        return true
    }
}
