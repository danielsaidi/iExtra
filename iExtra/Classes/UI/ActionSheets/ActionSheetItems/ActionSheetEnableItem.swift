//
//  ActionSheetEnableItem.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents an item that can be enabled and
 disabled. Unlike ActionSheetSelectItem, it is used to
 indicate enabled state instead of selected state.
 
 One example of how this item can be used, is a filter
 context, where filters can be enabled and disabled.
 
 */

import UIKit

open class ActionSheetEnableItemCell: ActionSheetItemCell { }


open class ActionSheetEnableItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(id: String, title: String, imageName: String?, isEnabled: Bool) {
        self.isEnabled = isEnabled
        super.init(id: id, title: title, imageName: imageName)
    }
    
    
    
    // MARK: - Properties
    
    public var isEnabled: Bool
    
    
    
    // MARK: - Appearance Properties
    
    public var disabledIcon = ActionSheetAppearance.enableItemDisabledIcon
    public var disabledTextColor = ActionSheetAppearance.enableItemDisabledTextColor
    public var disabledTintColor = ActionSheetAppearance.enableItemDisabledTintColor
    public var enabledIcon = ActionSheetAppearance.enableItemEnabledIcon
    public var enabledTextColor = ActionSheetAppearance.enableItemEnabledTextColor
    public var enabledTintColor = ActionSheetAppearance.enableItemEnabledTintColor
    
    
    
    // MARK: - Public Functions
    
    override open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = "ActionSheetEnableItemCell"
        return tableView.dequeueReusableCell(withIdentifier: id)
            ?? ActionSheetRadioButtonItemCell(style: .default, reuseIdentifier: id)
    }
    
    override open func refresh(cell: UITableViewCell) {
        super.refresh(cell: cell)
        applyColors(for: cell)
        applyRightIcon(for: cell)
    }
}



// MARK: - Private Functions

fileprivate extension ActionSheetEnableItem {
    
    func applyColors(for cell: UITableViewCell) {
        let textColor = isEnabled ? enabledTextColor : disabledTextColor
        let tintColor = isEnabled ? enabledTintColor : disabledTintColor
        cell.tintColor = tintColor ?? cell.tintColor
        cell.textLabel?.textColor = textColor ?? cell.textLabel?.textColor
    }
    
    func applyRightIcon(for cell: UITableViewCell) {
        let icon = isEnabled ? enabledIcon : disabledIcon
        cell.accessoryView = UIImageView(image: icon)
    }
}
