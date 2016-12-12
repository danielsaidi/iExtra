//
//  UITableView_Dequeue.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableView {
    
    public func dequeueCell(withType type: UITableViewCell.Type) -> UITableViewCell? {
        let id = type.defaultReuseIdentifier
        return dequeueReusableCell(withIdentifier: id)
    }
    
    public func dequeueCell(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> UITableViewCell {
        let id = type.defaultReuseIdentifier
        return dequeueReusableCell(withIdentifier: id, for: indexPath)
    }
    
    public func dequeueHeaderFooterView(withType type: UITableViewHeaderFooterView.Type) -> UITableViewHeaderFooterView? {
        let id = type.defaultReuseIdentifier
        return dequeueReusableHeaderFooterView(withIdentifier: id)
    }
}
