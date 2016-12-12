//
//  UITableView_Register.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableView {
    
    public func registerCell(withType type: UITableViewCell.Type) {
        let id = type.defaultReuseIdentifier
        register(type.defaultNib, forCellReuseIdentifier: id)
    }
    
    public func registerHeaderFooterView(withType type: UITableViewHeaderFooterView.Type) {
        let id = type.defaultNibName
        register(type.defaultNib, forHeaderFooterViewReuseIdentifier: id)
    }
}
