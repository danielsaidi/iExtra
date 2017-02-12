//
//  NavigationSearchController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This search controller is displayed in the navigation
 bar of another vc.
 
 When using this class in your apps, do not affect the
 default behavior. Instead, override updateSearchResults.
 
 */

import UIKit

open class NavigationSearchController : UISearchController, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    // MARK: - Initialization
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    
    // MARK: - Properties
    
    fileprivate weak var vc: UIViewController?
    
    
    
    // MARK: - Public functions
    
    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isActive = false
        super.dismiss(animated: true)
    }
    
    open func present(in vc: UIViewController) {
        self.vc = vc
        vc.definesPresentationContext = true
        vc.navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder()
    }
    
    
    
    // MARK: - UISearchBarDelegate
    
    open func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isActive = false
    }
    
    
    
    // MARK: - UISearchResultsUpdating
    
    open func updateSearchResults(for searchController: UISearchController) {
        DispatchQueue.main.async {
            self.searchResultsController?.view.isHidden = false
        }
    }
}



// MARK: - UISearchControllerDelegate

extension NavigationSearchController: UISearchControllerDelegate {
    
    public func didPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    public func willDismissSearchController(_ searchController: UISearchController) {
        vc?.navigationItem.titleView = nil
        let fadeOut = { searchController.view.alpha = 0 }
        UIView.animate(withDuration: 0.5, animations: fadeOut) {
            finished in searchController.view.alpha = 1
        }
    }
}
