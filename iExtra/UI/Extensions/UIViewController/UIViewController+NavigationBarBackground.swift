//
//  UIViewController+NavigationBarBackground.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-22.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 Calling the `navigationBarBackground` will either return an
 already created background or create one if none exists. It
 will be placed below the navigation bar and lets you easily
 customize it's appearance.
 
 */

import UIKit

public extension UIViewController {
    
    
    // MARK: - Properties
    
    public var navigationBarBackground: UIView? {
        let tag = navBarBackgroundTag
        return getNavBarBackground(tag) ?? createNavBarBackground(tag)
    }
}



// MARK: - Private Functions

fileprivate extension UIViewController {
    
    var navBarBackgroundTag: Int { return 324523 }
    
    func adjusted(_ bgView: UIView?) -> UIView? {
        guard let bar = navigationController?.navigationBar else { return nil }
        let width = view.frame.width
        let height = bar.frame.maxY
        bgView?.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return bgView
    }
    
    func createNavBarBackground(_ tag: Int) -> UIView? {
        guard let bar = navigationController?.navigationBar else { return nil }
        let bgView = UIView()
        bgView.tag = tag
        bgView.backgroundColor = .black
        bgView.autoresizingMask = [.flexibleWidth]
        view.insertSubview(bgView, belowSubview: bar)
        return adjusted(view.viewWithTag(tag))
    }
    
    func getNavBarBackground(_ tag: Int) -> UIView? {
        return adjusted(view.viewWithTag(tag))
    }    
}
