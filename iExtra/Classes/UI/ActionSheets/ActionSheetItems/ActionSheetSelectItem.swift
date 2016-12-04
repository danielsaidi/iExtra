//
//  ActionSheetSelectItem.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents a selectable action sheet item.
 
 It is to be used in action sheets, where one or many
 items can be selected and when the selected state of
 an item should be indicated.
 
 One example of usage can be to indicate the currently
 selected item in a list, then auto dismiss the action
 sheet when the user selects a new value, or let users
 select and unselect several options then submit their
 choice with an ok button.
 
 */

import UIKit

open class ActionSheetSelectItemCell: ActionSheetItemCell { }


open class ActionSheetSelectItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(id: String, title: String, imageName: String?, isSelected: Bool) {
        self.isSelected = isSelected
        super.init(id: id, title: title, imageName: imageName)
    }
    
    
    
    // MARK: - Properties
    
    public var isSelected: Bool
    
    
    
    // MARK: - Instance Appearance
    
    public var selectedIcon = ActionSheetAppearance.selectItemSelectedIcon
    public var selectedTintColor = ActionSheetAppearance.selectItemSelectedTintColor
    
    
    
    // MARK: - Public Functions
    
    override open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = "ActionSheetSelectItemCell"
        return tableView.dequeueReusableCell(withIdentifier: id)
            ?? ActionSheetSelectItemCell(style: .default, reuseIdentifier: id)
    }
    
    override open func refresh(cell: UITableViewCell) {
        super.refresh(cell: cell)
        applyColors(for: cell)
        let icon = isSelected ? selectedIcon : nil
        cell.accessoryView = UIImageView(image: icon)
    }
}



fileprivate extension ActionSheetSelectItem {
    
    func applyColors(for cell: UITableViewCell) {
        let useSelectedTint = isSelected && selectedTintColor != nil
        let color = useSelectedTint ? selectedTintColor : nil
        cell.tintColor = color ?? cell.tintColor
        cell.textLabel?.textColor = color ?? cell.textLabel?.textColor
    }
}
