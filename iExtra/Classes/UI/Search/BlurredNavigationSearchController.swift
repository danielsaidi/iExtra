//
//  BlurredNavigationSearchController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

open class BlurredNavigationSearchController : NavigationSearchController {
    
    
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
        searchResultsController?.view.backgroundColor = UIColor.clear
        let tableView = searchResultsController?.view as? UITableView
        tableView?.separatorEffect = UIVibrancyEffect(blurEffect: effect)
    }
}

