//
//  UITableView_Reload.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-20.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableView {

    func reloadData(with animation: UITableView.RowAnimation = .automatic) {
        let range: Range = 0..<numberOfSections
        let sections = IndexSet(integersIn: range)
        reloadSections(sections, with: animation)
    }
}
