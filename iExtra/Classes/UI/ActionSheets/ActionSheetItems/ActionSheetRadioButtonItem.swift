//
//  ActionSheetRadioButtonItem.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents a radio button item. Unlike the
 select action item, radio button items should be used
 in groups. The action sheet should not auto dismiss.
 
 Since this class has no-built in select handling, the
 action sheet must listen to its action event and make
 sure that the other items are deselected properly.
 
 One example of how to use the radio button item could
 be a collection of mutually exclusive preferences and
 an OK button for "submitting" the action sheet.
 
 */

import UIKit

open class ActionSheetRadioButtonItemCell: ActionSheetItemCell { }


open class ActionSheetRadioButtonItem: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(id: String, title: String, imageName: String?, isSelected: Bool) {
        self.isSelected = isSelected
        super.init(id: id, title: title, imageName: imageName)
    }
    
    
    
    // MARK: - Properties
    
    public var isSelected: Bool
    
    
    
    // MARK: - Appearance Properties
    
    public var selectedIcon = ActionSheetAppearance.radioButtonItemSelectedIcon
    public var selectedTintColor = ActionSheetAppearance.radioButtonItemSelectedTintColor
    public var unselectedIcon = ActionSheetAppearance.radioButtonItemUnselectedIcon
    public var unselectedTintColor = ActionSheetAppearance.radioButtonItemUnselectedTintColor
    
    
    
    // MARK: - Public Functions
    
    override open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = "ActionSheetRadioButtonItemCell"
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

fileprivate extension ActionSheetRadioButtonItem {
    
    func applyColors(for cell: UITableViewCell) {
        let tint = isSelected ? selectedTintColor : unselectedTintColor
        cell.tintColor = tint ?? cell.tintColor
        cell.textLabel?.textColor = tint ?? cell.textLabel?.textColor
    }
    
    func applyRightIcon(for cell: UITableViewCell) {
        let icon = isSelected ? selectedIcon : unselectedIcon
        cell.accessoryView = UIImageView(image: icon)
    }
}

