//
//  UICollectionViewCell+Text.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UILabel {
    
    public var hasText: Bool {
        return text?.count ?? 0 > 0
    }
    
    public var hasTrimmedText: Bool {
        return text?.trimmingCharacters(in: .whitespaces).count ?? 0 > 0
    }
}
