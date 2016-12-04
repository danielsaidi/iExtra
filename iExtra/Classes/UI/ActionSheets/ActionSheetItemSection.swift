//
//  ActionSheetItemSection.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

open class ActionSheetItemSection: NSObject {

    public init(title: String, items: [ActionSheetItem]) {
        self.title = title
        self.items = items
        super.init()
    }
    
    public var items: [ActionSheetItem]
    public var title: String
}
