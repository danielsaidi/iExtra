//
//  NoCancellingSearchController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

class NoCancellingSearchController: UISearchController {
    
    fileprivate var _searchBar = NoCancellingSearchBar()
    
    override var searchBar: UISearchBar {
        return _searchBar
    }
}

