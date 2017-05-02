//
//  UIViewController_Alert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public typealias AlertAction = (UIAlertAction) -> ()

public extension UIViewController {
    
    func alert(title: String, message: String, cancelText: String? = nil, actionText: String, action: AlertAction? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancelText = cancelText {
            let cancel = UIAlertAction(title: cancelText, style: .cancel)
            alert.addAction(cancel)
        }
        
        let action = UIAlertAction(title: actionText, style: .default, handler: action)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
