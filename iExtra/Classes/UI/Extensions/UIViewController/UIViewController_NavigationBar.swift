//
//  UIViewController_NavigationBar.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-22.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {

    public func makeNavigationBarTransparent() {
        navigationController?.navigationBar.makeTransparent()
    }
    
    public func makeNavigationBarNonTransparent() {
        navigationController?.navigationBar.makeNonTransparent()
    }
}
