//
//  UICollectionView+TableViewLayout.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func applyTableViewLayout(itemHeight: CGFloat, sectionMargin: CGFloat = 0, sectionHeaderHeight: CGFloat = 0) {
        let screenWidth = UIScreen.main.bounds.width
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: screenWidth, height: itemHeight)
        layout.headerReferenceSize = CGSize(width: 100, height: sectionHeaderHeight)
        alwaysBounceVertical = true
        collectionViewLayout = layout
    }
    
    func transitionTableViewLayout(toSize size: CGSize) {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.itemSize = CGSize(width: size.width, height: layout.itemSize.height)
        layout.invalidateLayout()
    }
}
