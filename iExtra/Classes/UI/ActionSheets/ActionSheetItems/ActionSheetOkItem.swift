//
//  ActionSheetOkItem.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents an action item that can be used
 to submit action sheets that do not use auto dismiss.
 
 Since this class has no-built in submit logic, action
 sheets should simply ignore events triggered by other
 item, whenever you use an ok item.
 
 */

import UIKit

open class ActionSheetOkItemCell: ActionSheetItemCell { }


open class ActionSheetOkItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(id: ActionSheetOkItem.id, title: title, imageName: nil)
    }
    
    
    // MARK: - Properties
    
    public static let id = "OK"
    
    
    // MARK: - Appearance Properties
    
    public var okTextColor = ActionSheetAppearance.okItemTextColor
    
    
    // MARK: - Functions
    
    override open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = "ActionSheetOkItemCell"
        return tableView.dequeueReusableCell(withIdentifier: id)
            ?? ActionSheetOkItemCell(style: .default, reuseIdentifier: id)
    }
    
    override open func refresh(cell: UITableViewCell) {
        super.refresh(cell: cell)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = okTextColor ?? cell.textLabel?.textColor
    }
}
