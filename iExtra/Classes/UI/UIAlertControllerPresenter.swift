//
//  UIAlertControllerPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public class UIAlertControllerPresenter {
    
    private static var alertWindow: UIWindow?
    
    public static func show(_ alert: UIAlertController) {
        show(alert, animated: true)
    }
    
    public static func show(_ alert: UIAlertController, animated: Bool) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindowLevelAlert + 1
        window.makeKeyAndVisible()
        window.rootViewController!.present(alert, animated:animated) {}
        alertWindow = window
    }
}
