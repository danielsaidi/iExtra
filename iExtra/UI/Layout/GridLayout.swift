//
//  GridLayout.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

open class GridLayout: UICollectionViewFlowLayout {
    
    public override init() {
        super.init()
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open func setup() {
        scrollDirection = .vertical
        minimumLineSpacing = 10
    }
    
    
    open func calculateItemSize(forSize size: CGSize, itemHeight: CGFloat, numberOfColumns: Int) -> CGSize {
        let totalWidth = size.width
        let cols = numberOfColumns
        let width = calculateItemWidth(forTotalWidth: totalWidth, numberOfColumns: cols)
        return CGSize(width: width, height: itemHeight)
    }
    
    open func calculateItemWidth(forTotalWidth width: CGFloat, numberOfColumns: Int) -> CGFloat {
        let columns = CGFloat(numberOfColumns)
        let requiredItemSpacing = (columns - 1) * minimumLineSpacing
        let availableWidth = width - horizontalInsets - requiredItemSpacing
        return availableWidth / columns
    }
}
