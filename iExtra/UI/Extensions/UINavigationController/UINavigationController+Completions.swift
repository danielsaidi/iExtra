//
//  UINavigationController+Completions.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-13.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    public func pushViewController(_ vc: UIViewController, animated: Bool, completion: @escaping () -> ()) {
        pushViewController(vc, animated: animated)
        doAfterAnimatingTransition(animated: animated, completion: completion)
    }
    
    public func popViewController(animated: Bool, completion: @escaping () -> ()) {
        popViewController(animated: animated)
        doAfterAnimatingTransition(animated: animated, completion: completion)
    }
    
    public func popToRootViewController(animated: Bool, completion: @escaping () -> ()) {
        popToRootViewController(animated: animated)
        doAfterAnimatingTransition(animated: animated, completion: completion)
    }
}


private extension UINavigationController {

    func doAfterAnimatingTransition(animated: Bool, completion: @escaping (() -> Void)) {
        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in completion() }
        } else {
            DispatchQueue.main.async { completion() }
        }
    }
}
