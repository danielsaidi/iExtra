//
//  DismissContext.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public final class PannableModalPresenter: NSObject {
    
    
    // MARK: - Initialization
    
    public override init() {
        super.init()
        PannableModalPresenter.cache.append(self)
    }
    
    deinit {
        print("PannableModalPresenter: Deinit")
    }
    
    
    // MARK: - Properties
    
    fileprivate static var cache = [PannableModalPresenter]()
    fileprivate var fromStatusBarStyle: UIStatusBarStyle?
    fileprivate var panGesture: UIPanGestureRecognizer?
    fileprivate var toStatusBarStyle: UIStatusBarStyle?
    fileprivate let transition = InteractiveModalTransition()
    fileprivate weak var viewController: UIViewController?
    
    
    // MARK: - Public Functions
    
    public static func disablePanGesture(for vc: UIViewController) {
        presenter(for: vc)?.panGesture?.isEnabled = false
    }
    
    public static func enablePanGesture(for vc: UIViewController) {
        presenter(for: vc)?.panGesture?.isEnabled = true
    }
    
    public static func present(vc: UIViewController, from: UIViewController, statusBarStyle: UIStatusBarStyle? = nil) {
        let presenter = PannableModalPresenter()
        presenter.viewController = vc
        presenter.fromStatusBarStyle = UIApplication.shared.statusBarStyle
        presenter.toStatusBarStyle = statusBarStyle ?? presenter.fromStatusBarStyle
        
        vc.transitioningDelegate = presenter
        from.present(vc, animated: true) {
            presenter.addPanGesture(to: vc.view)
            presenter.setStatusBarStyle(presenter.toStatusBarStyle)
        }
    }
    
    public static func presenter(for vc: UIViewController) -> PannableModalPresenter? {
        return cache.first { $0.viewController == vc }
    }
}


// MARK: - Deallocation

extension PannableModalPresenter {
    
    static func destroy(presenter: PannableModalPresenter?) {
        guard let presenter = presenter else { return }
        presenter.destroyPanGesture()
        guard let index = cache.index(of: presenter) else { return }
        cache.remove(at: index)
    }
    
    fileprivate func destroyPanGesture() {
        guard let pan = panGesture else { return }
        viewController?.view.removeGestureRecognizer(pan)
        panGesture = nil
    }
}


// MARK: - Selectors

@objc extension PannableModalPresenter {
    
    func handlePanGesture(pan: UIPanGestureRecognizer) {
        guard let view = pan.view else { return }
        
        let percentThreshold: CGFloat = 0.3
        
        let translation = pan.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        adjustStatusBar(for: translation.y)
        
        switch pan.state {
        case .began:
            transition.hasStarted = true
            viewController?.dismiss(animated: true)
        case .changed:
            transition.shouldFinish = progress > percentThreshold
            transition.update(progress)
        case .cancelled:
            transition.hasStarted = false
            transition.cancel()
        case .ended:
            transition.hasStarted = false
            transition.shouldFinish ? transition.finish() : transition.cancel()
            adjustStatusBar(for: transition.shouldFinish)
        default:
            break
        }
    }
}


// MARK: - Private Functions

fileprivate extension PannableModalPresenter {
    
    func addPanGesture(to view: UIView?) {
        guard let view = view else { return }
        let action = #selector(handlePanGesture(pan:))
        let pan = UIPanGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(pan)
        panGesture = pan
    }
    
    func adjustStatusBar(for translation: CGFloat) {
        let style = translation > 70 ? fromStatusBarStyle : toStatusBarStyle
        setStatusBarStyle(style)
    }
    
    func adjustStatusBar(for isDismissing: Bool) {
        let style = isDismissing ? fromStatusBarStyle : toStatusBarStyle
        setStatusBarStyle(style)
    }
    
    func setStatusBarStyle(_ style: UIStatusBarStyle?) {
        guard let style = style else { return }
        guard fromStatusBarStyle != toStatusBarStyle else { return }
        UIApplication.shared.statusBarStyle = style
    }
}


// MARK: - PannableModalDismissAnimatorDelegate

extension PannableModalPresenter: PannableModalDismissAnimatorDelegate {
    
    func dismissAnimatorDidDismiss(_ animator: PannableModalDismissAnimator) {
        setStatusBarStyle(fromStatusBarStyle)
        PannableModalPresenter.destroy(presenter: self)
    }
}


// MARK: - UIViewControllerTransitioningDelegate

extension PannableModalPresenter: UIViewControllerTransitioningDelegate {
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = PannableModalDismissAnimator()
        animator.delegate = self
        return animator
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return transition.hasStarted ? transition : nil
    }
}
