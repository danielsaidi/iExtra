//
//  UIAlertControllerPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "Do not use this one anymore.")
public class UIAlertControllerPresenter {
    
    private static var alertWindow: UIWindow?
    
    public static func show(_ alert: UIAlertController) {
        show(alert, animated: true)
    }
    
    public static func show(_ alert: UIAlertController, animated: Bool) {
        let vc = UIViewController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.windowLevel = UIWindowLevelAlert + 1
        window.makeKeyAndVisible()
        vc.present(alert, animated:animated) {}
        alertWindow = window
    }
}
