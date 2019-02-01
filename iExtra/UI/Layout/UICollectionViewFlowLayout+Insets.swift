//
//  UICollectionViewFlowLayout+Insets.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UICollectionViewFlowLayout {
    
    var horizontalInsets: CGFloat {
        return sectionInset.left + sectionInset.right
    }
    
    var verticalInsets: CGFloat {
        return sectionInset.top + sectionInset.bottom
    }
}
