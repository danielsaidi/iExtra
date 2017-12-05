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


open class NavigationSearchControllerBarButtonItem: UIBarButtonItem {}


open class NavigationSearchController: UISearchController, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    // MARK: - Initialization
    
    public override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        setup()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - Properties
    
    fileprivate weak var vc: UIViewController? {
        didSet {
            vc?.definesPresentationContext = true
            vc?.navigationItem.titleView = searchBar
            vcRightButton = vc?.navigationItem.rightBarButtonItem
            addManualCancelButton()
        }
    }
    
    fileprivate weak var vcRightButton: UIBarButtonItem?
    
    
    // MARK: - Public functions
    
    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isActive = false
        super.dismiss(animated: true)
    }
    
    open func present(in vc: UIViewController, makeFirstResponder: Bool = false) {
        self.vc = vc
        delay(0.5) { self.isActive = true }
        delay(1.0) { self.searchBar.becomeFirstResponder() }
    }
    
    
    // MARK: - UISearchBarDelegate
    
    open func cancelButtonTapped() {
        isActive = false
    }
    
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


// MARK: - Private Functions

fileprivate extension NavigationSearchController {
    
    func addManualCancelButton() {
        guard UIDevice.current.userInterfaceIdiom == .pad else { return }
        vc?.navigationItem.rightBarButtonItem = createCancelButton()
    }
    
    func createCancelButton() -> UIBarButtonItem {
        let action = #selector(cancelBarButtonTapped)
        return NavigationSearchControllerBarButtonItem(title: "Cancel", style: .plain, target: self, action: action)
    }
    
    func setup() {
        delegate = self
        searchResultsUpdater = self
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        dimsBackgroundDuringPresentation = true
        hidesNavigationBarDuringPresentation = false
    }
}


// MARK: - Selectors

@objc extension NavigationSearchController {
    
    func cancelBarButtonTapped() {
        cancelButtonTapped()
    }
}


// MARK: - UISearchControllerDelegate

extension NavigationSearchController: UISearchControllerDelegate {
    
    public func willDismissSearchController(_ searchController: UISearchController) {
        vc?.navigationItem.titleView = nil
        vc?.navigationItem.rightBarButtonItem = vcRightButton
        vc?.viewWillAppear(true)
        let fadeOut = { searchController.view.alpha = 0 }
        UIView.animate(withDuration: 0.5, animations: fadeOut) {
            finished in searchController.view.alpha = 1
        }
    }
}
