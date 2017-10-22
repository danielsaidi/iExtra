//
//  UIViewController_Alert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 The Localized-based extension functions are the most
 convenient, and are the intended usage. By adding an
 implementation of the Localized protocol to your app
 (e.g. adding a SwiftGen extension that implements it
 for the auto-generated L10n enum) you can use alerts
 with type safety.
 
 */

import UIKit

public typealias AlertAction = (() -> ())


public extension UIViewController {
    
    var canAlert: Bool {
        return !self.isKind(of: UIAlertController.self)
    }
    
    func alert(title: String, message: String, buttonText: String) {
        alert(title: title, message: message, buttonText: buttonText) {}
    }
    
    func alert(title: String, message: String, buttonText: String, completion: @escaping AlertAction) {
        alert(title: title, message: message, actionText: buttonText, cancelText: nil) {}
    }
    
    func alert(title: String, message: String, actionText: String, cancelText: String?, action: @escaping AlertAction) {
        guard canAlert else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        setupCancelAction(in: alert, with: cancelText)
        let actionButton = UIAlertAction(title: actionText, style: .default, handler: { (_) in action() })
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
