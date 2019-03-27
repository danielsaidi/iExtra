//
//  UIApplication+RefreshApperance.swift
//  iExtra
//
//  Inspired by: https://ngs.io/2014/10/26/refresh-ui-appearance/
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIApplication {

    func refreshAppearance() {
        for window in windows {
            window.subviews.forEach {
                $0.removeFromSuperview()
                window.addSubview($0)
            }
        }
    }
}
