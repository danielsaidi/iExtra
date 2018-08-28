//
//  UIViewController+Alert.swift
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
    
    func alert(title: String, message: String, buttonText: String) {
        alert(title: title, message: message, buttonText: buttonText) {}
    }
    
    func alert(title: String, message: String, buttonText: String, completion: @escaping AlertAction) {
        alert(title: title, message: message, actionText: buttonText, cancelText: nil) {}
    }
    
    func alert(title: String, message: String, actionText: String, cancelText: String?, action: @escaping AlertAction) {
        guard let alert = getAlert(withTitle: title, message: message, actionText: actionText, cancelText: cancelText, textFieldPlaceholders: [], action: action) else { return }
        present(alert, animated: true, completion: nil)
    }
    
    func alertTextInput(title: String, message: String, actionText: String, cancelText: String?, textFieldPlaceholders: [String], action: @escaping AlertAction) {
        guard let alert = getAlert(withTitle: title, message: message, actionText: actionText, cancelText: cancelText, textFieldPlaceholders: textFieldPlaceholders, action: action) else { return }
        present(alert, animated: true, completion: nil)
    }
}


private extension UIViewController {
    
    func getAlert(withTitle title: String, message: String, actionText: String, cancelText: String?, textFieldPlaceholders: [String], action: @escaping AlertAction) -> UIAlertController? {
        guard canAlert else { return nil }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        setupCancelButton(in: alert, title: cancelText)
        setupActionButton(in: alert, title: actionText, action: action)
        setupTextFields(in: alert, placeholders: textFieldPlaceholders)
        present(alert, animated: true, completion: nil)
        return alert
    }
    
    func setupActionButton(in alert: UIAlertController, title: String, action: @escaping AlertAction) {
        let button = UIAlertAction(title: title, style: .cancel)
        alert.addAction(button)
    }
    
    func setupCancelButton(in alert: UIAlertController, title: String?) {
        guard let title = title else { return }
        let button = UIAlertAction(title: title, style: .cancel)
        alert.addAction(button)
    }
    
    func setupTextFields(in alert: UIAlertController, placeholders: [String]) {
        placeholders.forEach { placeholder in
            alert.addTextField { textField in
                textField.placeholder = placeholder
            }
        }
    }
}
