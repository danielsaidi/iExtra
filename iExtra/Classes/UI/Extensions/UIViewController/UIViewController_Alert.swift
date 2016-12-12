//
//  UIViewController_Alert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func alert(title: String, message: String, buttonText: String) {
        alert(title: title, message: message, buttonText: buttonText, action: nil)
    }
    
    func alert(title: String, message: String, buttonText: String, action: ((UIAlertAction) -> ())?) {
        UIAlertController.alert(title: title, message: message, buttonText: buttonText, from: self, action: action)
    }
}
