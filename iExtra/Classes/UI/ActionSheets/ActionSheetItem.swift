//
//  ActionSheetItem.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents a default action item, like the
 one you normally see in a UIAlertController.
 
 Default action items normally auto dismiss the action
 sheet. They are normally used to let users select one
 of multiple options.
 
 To change the global action sheet item appearance for
 your app, modify the static appearance class (until I
 find out how to create proper appearance proxies). To
 change the appearance of single items, modify the non-
 static appearance properties instead. Most subclasses
 handle appearance in this way as well.
 
 */

import UIKit

open class ActionSheetItemCell: UITableViewCell {

    override open func layoutSubviews() {
        super.layoutSubviews()
        guard let view = imageView, let label = textLabel else { return }
        guard view.image != nil else { return }
        view.center.x += 10
        label.center.x += 10
    }
}


open class ActionSheetItem: NSObject {
    
    
    // MARK: - Initialization
    
    public init(id: String, title: String, imageName: String?) {
        self.id = id
        self.title = title
        self.image = imageName == nil ? nil : UIImage(named: imageName!)
        super.init()
    }
    
    
    
    // MARK: - Properties
    
    public var id: String
    public var image: UIImage?
    public var title: String
    
    
    
    // MARK: - Appearance Properties
    
    public var font = ActionSheetAppearance.itemFont
    public var textColor = ActionSheetAppearance.itemTextColor
    public var tintColor = ActionSheetAppearance.itemTintColor
    
    
    
    // MARK: - Functions
    
    open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = "ActionSheetItemCell"
        return tableView.dequeueReusableCell(withIdentifier: id)
            ?? ActionSheetItemCell(style: .default, reuseIdentifier: id)
    }
    
    open func refresh(cell: UITableViewCell) {
        cell.imageView?.image = image
        cell.tintColor = tintColor ?? cell.tintColor
        cell.textLabel?.text = title
        cell.textLabel?.textColor = textColor ?? cell.textLabel?.textColor
        cell.textLabel?.font = font ?? cell.textLabel?.font
    }
}
