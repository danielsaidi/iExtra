//
//  UITableView_DefaultNib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit


public protocol ReusableTableViewCell {
    static var defaultReuseIdentifier: String { get }
}

public protocol ReusableTableViewHeaderFooterView {
    static var defaultReuseIdentifier: String { get }
}


extension UITableViewCell: ReusableTableViewCell {}

extension UITableViewHeaderFooterView: ReusableTableViewHeaderFooterView {}


public extension UITableView {
    
    public func dequeueCellWithDefaultNib<T: ReusableTableViewCell>() -> T? {
        let id = T.defaultReuseIdentifier
        return dequeueReusableCell(withIdentifier: id) as? T
    }
    
    public func dequeueCellWithDefaultNib<T: ReusableTableViewCell>(at indexPath: IndexPath) -> T? {
        let id = T.defaultReuseIdentifier
        return dequeueReusableCell(withIdentifier: id, for: indexPath) as? T
    }
    
    public func dequeueHeaderFooterViewWithDefaultNib<T: ReusableTableViewHeaderFooterView>() -> T? {
        let id = T.defaultReuseIdentifier
        return dequeueReusableHeaderFooterView(withIdentifier: id) as? T
    }
    
    public func registerCellWithDefaultNib(for type: UITableViewCell.Type) {
        let id = type.defaultReuseIdentifier
        register(type.defaultNib, forCellReuseIdentifier: id)
    }
    
    public func registerHeaderFooterViewWithDefaultNib(for type: UITableViewHeaderFooterView.Type) {
        let id = type.defaultNibName
        register(type.defaultNib, forHeaderFooterViewReuseIdentifier: id)
    }
}
