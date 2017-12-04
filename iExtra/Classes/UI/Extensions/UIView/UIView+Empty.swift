//
//  UIView+Empty.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public static var empty: UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0.01, height: 0.01))
        view.backgroundColor = UIColor.clear
        return view
    }
}
