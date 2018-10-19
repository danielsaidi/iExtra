//
//  ThemedLabel.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This class can be used to apply custom label fonts with the
 `appearance()` proxy.
 
 */

import UIKit

open class ThemedLabel: UILabel {

    @objc open dynamic var themedFont: UIFont? {
        get { return font }
        set { font = newValue }
    }
}
