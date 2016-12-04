//
//  UIAlertController_Alert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIAlertController {

    static func alert(title: String, message: String, buttonText: String, from vc: UIViewController) {
        alert(title: title, message: message, buttonText: buttonText, from: vc, action: nil)
    }
    
    static func alert(title: String, message: String, buttonText: String, from vc: UIViewController, action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: action))
        vc.present(alert, animated: true, completion: nil)
    }
}
