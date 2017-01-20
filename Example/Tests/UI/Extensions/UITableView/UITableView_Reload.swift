//
//  UITableView_Reload.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-20.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableView {

    public func reloadData(with animation: UITableViewRowAnimation = .automatic) {
        let range = NSMakeRange(0, numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        reloadSections(sections as IndexSet, with: animation)
    }
}
