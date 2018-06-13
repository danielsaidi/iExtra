//
//  UIView+AsyncTag.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-06-13.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func setupAsyncTag() -> Int {
        tag = Int.random(in: 1...10000)
        return tag
    }
}
