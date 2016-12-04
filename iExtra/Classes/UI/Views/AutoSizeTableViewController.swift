//
//  AutoSizeTableViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-30.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

open class AutoSizeTableViewController: UITableViewController {
    
    open func autosizeTableView() {
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.reloadData()
    }
    
    open override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
