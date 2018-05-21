//
//  UICollectionView+DefaultCell.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol ReusableCollectionViewCell {
    static var defaultReuseIdentifier: String { get }
}

extension UICollectionViewCell: ReusableCollectionViewCell {}


public extension UICollectionView {
    
    public func dequeueDefaultCell<T: ReusableCollectionViewCell>(at indexPath: IndexPath) -> T {
        let id = T.defaultReuseIdentifier
        let dequeued = dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
        guard let cell = dequeued as? T else { fatalError("dequeueDefaultCell: Invalid class") }
        return cell
    }
    
    public func registerDefaultCell(for type: UICollectionViewCell.Type) {
        let id = type.defaultReuseIdentifier
        register(type.defaultNib, forCellWithReuseIdentifier: id)
    }
}
