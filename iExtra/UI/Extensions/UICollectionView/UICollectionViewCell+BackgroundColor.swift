//
//  UICollectionViewCell+BackgroundColor.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    
    func setBackgroundColor(at indexPath: IndexPath, oddColor: UIColor?, evenColor: UIColor?) {
        let isOdd = indexPath.row % 2 == 1
        backgroundColor = (isOdd ? oddColor : evenColor) ?? .clear
    }
}
