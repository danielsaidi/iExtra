//
//  UICollectionView_DefaultNib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    public func dequeueDefaultCell<T: ReusableCollectionViewCell>(at indexPath: IndexPath) -> T {
        let id = T.defaultReuseIdentifier
        return dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! T
    }
    
    public func registerDefaultCell(for type: UICollectionViewCell.Type) {
        let id = type.defaultReuseIdentifier
        register(type.defaultNib, forCellWithReuseIdentifier: id)
    }
    
    public func typedCellForItem<T: ReusableCollectionViewCell>(at indexPath: IndexPath) -> T {
        return cellForItem(at: indexPath) as! T
    }
}


// MARK: - ReusableCollectionViewCell

public protocol ReusableCollectionViewCell {
    static var defaultReuseIdentifier: String { get }
}

extension UICollectionViewCell: ReusableCollectionViewCell {}
