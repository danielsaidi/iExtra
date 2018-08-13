//
//  NavigationBarTriggerViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by view controllers, where
 the navigation bar should react to a certain trigger.
 
 For instance, a view controller could have a navigation bar
 that should be transparent until `navigationBarTriggerView`
 has scrolled past the navigation bar.
 
 You should implement `styleNavigationBar` to style your nav
 bar depending on the value of `isNavigationBarTriggerActive`.
 Make sure to call this function when the view controller is
 presented as well, to ensure that the bar is always correct.
 
 Then you must call `updateNavigationBarTrigger(with:)` when
 your scroll view scrolls. It sets `isNavigationBarTriggered`
 only if needed, and if so calls `styleNavigationBar` with a
 short animation duration.
 
 If you want to perform a custom animation when this trigger
 changes, override the `animateNavigationBarTriggerDidChange`
 function and perform any animations you like there.
 
 */

public enum NavigationBarTrigger {
    case triggerViewHasScrolledToNavigationBar
    case triggerViewHasScrolledPastNavigationBar
}


public protocol NavigationBarTriggerViewController: class {
    
    var isNavigationBarTriggerActive: Bool { get set }
    var navigationBarTrigger: NavigationBarTrigger { get }
    var navigationBarTriggerView: UIView { get }
    
    func animateNavigationBarTriggerDidChange()
    func styleNavigationBar()
}


// MARK: - Public Functions

public extension NavigationBarTriggerViewController {
    
    public func updateNavigationBarTrigger(with scrollView: UIScrollView, fadeDuration: TimeInterval = 0.3) {
        let isActive = checkIfTriggerIsActive()
        if isNavigationBarTriggerActive == isActive { return }
        isNavigationBarTriggerActive = isActive
        animateNavigationBarTriggerDidChange()
        UIView.animate(withDuration: fadeDuration) {
            self.styleNavigationBar()
        }
    }
}


// MARK: - Private Functions

private extension NavigationBarTriggerViewController {
    
    func checkIfTriggerIsActive() -> Bool {
        guard
            let vc = self as? UIViewController,
            let view = vc.view,
            let bar = vc.navigationController?.navigationBar
            else { return false }
        
        let barFrame = bar.convert(bar.bounds, to: view)
        let triggerView = navigationBarTriggerView
        let triggerFrame = triggerView.convert(triggerView.bounds, to: view)
        
        switch navigationBarTrigger {
        case .triggerViewHasScrolledToNavigationBar:
            return triggerFrame.minY <= barFrame.maxY
        case .triggerViewHasScrolledPastNavigationBar:
            return triggerFrame.maxY < barFrame.maxY
        }
    }
}
