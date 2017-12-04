//
//  UITableView+DefaultNib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableView {
    
    public func dequeueDefaultCell<T: ReusableTableViewCell>() -> T? {
        let id = T.defaultReuseIdentifier
        return dequeueReusableCell(withIdentifier: id) as? T
    }
    
    public func dequeueDefaultCell<T: ReusableTableViewCell>(at indexPath: IndexPath) -> T! {
        let id = T.defaultReuseIdentifier
        return dequeueReusableCell(withIdentifier: id, for: indexPath) as! T
    }
    
    public func dequeueDefaultHeaderFooterView<T: ReusableTableViewHeaderFooterView>() -> T? {
        let id = T.defaultReuseIdentifier
        return dequeueReusableHeaderFooterView(withIdentifier: id) as? T
    }
    
    public func registerDefaultCell(for type: UITableViewCell.Type) {
        let id = type.defaultReuseIdentifier
        register(type.defaultNib, forCellReuseIdentifier: id)
    }
    
    public func registerDefaultHeaderFooterView(for type: UITableViewHeaderFooterView.Type) {
        let id = type.defaultNibName
        register(type.defaultNib, forHeaderFooterViewReuseIdentifier: id)
    }
}



// MARK: - ReusableTableViewCell

public protocol ReusableTableViewCell {
    static var defaultReuseIdentifier: String { get }
}

extension UITableViewCell: ReusableTableViewCell {}


// MARK: - ReusableTableViewHeaderFooterView

public protocol ReusableTableViewHeaderFooterView {
    static var defaultReuseIdentifier: String { get }
}

extension UITableViewHeaderFooterView: ReusableTableViewHeaderFooterView {}
