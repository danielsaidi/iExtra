//
//  NoCancellingSearchController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-19.
//  Copyright (c) 2016 Daniel Saidi. All rights reserved.
//

import UIKit

class NoCancellingSearchController: UISearchController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        _searchBar = NoCancellingSearchBar()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(searchResultsController: UIViewController?) {
        _searchBar = NoCancellingSearchBar()
        super.init(searchResultsController: searchResultsController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        _searchBar = NoCancellingSearchBar()
        super.init(coder: aDecoder)
    }
    
    
    var _searchBar: NoCancellingSearchBar
    
    override var searchBar: UISearchBar {
        return _searchBar
    }
}

