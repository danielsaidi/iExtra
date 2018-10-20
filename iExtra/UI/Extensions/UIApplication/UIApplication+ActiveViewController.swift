//
//  UIApplication+ActiveViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    var activeViewController: UIViewController? {
        return keyWindow?.rootViewController?.activeViewController
    }
}
