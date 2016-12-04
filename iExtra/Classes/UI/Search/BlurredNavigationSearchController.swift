//
//  ViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This search controller is displayed in the navigation
 bar of another vc and will blur the background.
 
 When using this class in your apps, do not affect its
 default behavior. Let the delegate and result updates
 be, and instead override the updateSearchResults func.
 
 */

import UIKit

open class BlurredNavigationSearchController : UISearchController, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    // MARK: - Initialization
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(withBlurEffect: applyBlurEffect())
    }
    
    public init(searchResultsController: UIViewController?, blurStyle: UIBlurEffectStyle, blurAlpha: CGFloat) {
        super.init(searchResultsController: searchResultsController)
        setup(withBlurEffect: applyBlurEffect(withBlurStyle: blurStyle, alpha: blurAlpha))
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


// MARK: - Private functions

fileprivate extension BlurredNavigationSearchController {
    
    func applyBlurEffect() -> UIBlurEffect {
        return applyBlurEffect(withBlurStyle: .dark, alpha: 1.0)
    }
    
    func applyBlurEffect(withBlurStyle style: UIBlurEffectStyle, alpha: CGFloat) -> UIBlurEffect {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.frame
        blurView.alpha = alpha
        view.insertSubview(blurView, at: 0)
        blurView.makeFullSize(in: view)
        return blurEffect
    }
    
    func setup(withBlurEffect effect: UIBlurEffect) {
        delegate = self
        searchBar.delegate = self
        searchResultsUpdater = self
        
        hidesNavigationBarDuringPresentation = false
        dimsBackgroundDuringPresentation = true
        
        searchResultsController?.view.backgroundColor = UIColor.clear
        let tableView = searchResultsController?.view as? UITableView
        tableView?.separatorEffect = UIVibrancyEffect(blurEffect: effect)
    }
}



// MARK: - UISearchControllerDelegate

extension BlurredNavigationSearchController: UISearchControllerDelegate {
    
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

