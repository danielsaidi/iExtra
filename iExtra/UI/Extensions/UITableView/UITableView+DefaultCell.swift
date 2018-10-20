//
//  UITableView+DefaultCell.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func dequeueDefaultCell<T: ReusableTableViewCell>() -> T? {
        let id = T.defaultReuseIdentifier
        return dequeueReusableCell(withIdentifier: id) as? T
    }
    
    func dequeueDefaultCell<T: ReusableTableViewCell>(at indexPath: IndexPath) -> T {
        let id = T.defaultReuseIdentifier
        let dequeued = dequeueReusableCell(withIdentifier: id, for: indexPath)
        guard let cell = dequeued as? T else { fatalError("dequeueDefaultCell: Invalid type") }
        return cell
    }
    
    func dequeueDefaultHeaderFooterView<T: ReusableTableViewHeaderFooterView>() -> T? {
        let id = T.defaultReuseIdentifier
        return dequeueReusableHeaderFooterView(withIdentifier: id) as? T
    }
    
    func registerDefaultCell(for type: UITableViewCell.Type) {
        let id = type.defaultReuseIdentifier
        register(type.defaultNib, forCellReuseIdentifier: id)
    }
    
    func registerDefaultHeaderFooterView(for type: UITableViewHeaderFooterView.Type) {
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
