//
//  UIViewController_Alert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public typealias AlertAction = (() -> ())


public extension UIViewController {
    
    var canAlert: Bool {
        return !self.isKind(of: UIAlertController.self)
    }
    
    func alert(title: Localized, message: Localized, buttonText: Localized) {
        alert(title: title, message: message, cancelText: nil, actionText: buttonText, action: nil)
    }
    
    func alert(title: Localized, message: Localized, buttonText: Localized, action: AlertAction?) {
        alert(title: title, message: message, cancelText: nil, actionText: buttonText, action: action)
    }
    
    func alert(title: Localized, message: Localized, cancelText: Localized?, actionText: Localized, action: AlertAction?) {
        let title = title.localizedString
        let message = message.localizedString
        let cancelText = cancelText?.localizedString
        let actionText = actionText.localizedString
        alert(title: title, message: message, cancelText: cancelText, actionText: actionText, action: action)
    }
    
    func alert(title: String, message: String, cancelText: String?, actionText: String, action: AlertAction?) {
        guard canAlert else { return }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        setupCancelAction(in: alert, with: cancelText)
        let actionButton = UIAlertAction(title: actionText, style: .default, handler: { (_) in action?() })
        alert.addAction(actionButton)
        
        present(alert, animated: true, completion: nil)
    }
}


fileprivate extension UIViewController {
    
    func setupCancelAction(in alert: UIAlertController, with title: String?) {
        guard let title = title else { return }
        let cancelButton = UIAlertAction(title: title, style: .cancel)
        alert.addAction(cancelButton)
    }
}
