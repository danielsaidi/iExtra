//
//  ActionSheetCancelItem.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents an action item that can be used
 to dismiss an action sheet without action.
 
 Since this class has no-built in cancelling logic, an
 action sheet should simply ignore events triggered by
 a cancel item.
 
 */

import UIKit

open class ActionSheetCancelItemCell: ActionSheetItemCell { }


open class ActionSheetCancelItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(id: ActionSheetCancelItem.id, title: title, imageName: nil)
    }
    
    
    // MARK: - Properties
    
    public static let id = "Cancel"
    
    
    // MARK: - Appearance Properties
    
    public var cancelTextColor = ActionSheetAppearance.cancelItemTextColor
    
    
    // MARK: - Functions
    
    override open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = "ActionSheetCancelItemCell"
        return tableView.dequeueReusableCell(withIdentifier: id)
            ?? ActionSheetCancelItemCell(style: .default, reuseIdentifier: id)
    }
    
    override open func refresh(cell: UITableViewCell) {
        super.refresh(cell: cell)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = cancelTextColor ?? cell.textLabel?.textColor
    }
}
