//
//  UIViewController+RequiredTextField.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {

    func assertRequiredContent(in textField: UITextField?) -> Bool {
        guard let textField = textField else { return false }
        guard let text = textField.text else { return false }
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        let hasValue = trimmed.count > 0
        if !hasValue {
            textField.becomeFirstResponder()
        }
        return hasValue
    }
    
    func assertRequiredContent(in textFields: [UITextField?]) -> Bool {
        return textFields.first { !assertRequiredContent(in: $0) } == nil
    }
}
