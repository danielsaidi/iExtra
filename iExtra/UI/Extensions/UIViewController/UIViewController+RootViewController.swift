//
//  UIViewController+RootViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    var rootViewController: UIViewController {
        return parent?.rootViewController ?? self
    }
}
