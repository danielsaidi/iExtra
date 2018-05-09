//
//  ThemedLabel.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

open class ThemedLabel: UILabel {

    @objc open dynamic var themedFont: UIFont? {
        get { return font }
        set { font = newValue }
    }
}
