//
//  BlurredNavigationSearchController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-18.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

open class BlurredNavigationSearchController: NavigationSearchController {
    
    
    // MARK: - Initialization
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(withBlurEffect: blurEffect(withStyle: .dark, alpha: 1.0))
    }
    
    public init(searchResultsController: UIViewController?, blurStyle: UIBlurEffect.Style, blurAlpha: CGFloat) {
        super.init(searchResultsController: searchResultsController)
        setup(withBlurEffect: blurEffect(withStyle: blurStyle, alpha: blurAlpha))
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}


// MARK: - Private functions

private extension BlurredNavigationSearchController {
    
    func blurEffect(withStyle style: UIBlurEffect.Style, alpha: CGFloat) -> UIBlurEffect {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.frame
        blurView.alpha = alpha
        view.insertSubview(blurView, at: 0)
        view.addSubview(blurView, fill: true)
        return blurEffect
    }
    
    func setup(withBlurEffect effect: UIBlurEffect) {
        searchResultsController?.view.backgroundColor = UIColor.clear
        let tableView = searchResultsController?.view as? UITableView
        tableView?.separatorEffect = UIVibrancyEffect(blurEffect: effect)
    }
}
