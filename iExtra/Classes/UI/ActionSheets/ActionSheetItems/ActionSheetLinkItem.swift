//
//  ActionSheetLinkItem.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetLinkItemCell: ActionSheetItemCell { }


open class ActionSheetLinkItem: ActionSheetItem {
    
    
    // MARK: - Appearance Properties
    
    public var linkIcon = ActionSheetAppearance.linkItemIcon
    public var linkTintColor = ActionSheetAppearance.linkItemTintColor
    
    
    
    // MARK: - Functions
    
    override open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = "ActionSheetSelectItemCell"
        return tableView.dequeueReusableCell(withIdentifier: id)
            ?? ActionSheetSelectItemCell(style: .default, reuseIdentifier: id)
    }
    
    override open func refresh(cell: UITableViewCell) {
        super.refresh(cell: cell)
        cell.tintColor = linkTintColor ?? cell.tintColor
        cell.textLabel?.textColor = linkTintColor ?? cell.textLabel?.textColor
        cell.accessoryView = UIImageView(image: linkIcon)
    }
}
