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
    
    fileprivate var panGesture: UIPanGestureRecognizer?
    
    fileprivate let transition = InteractiveModalTransition()
    
    fileprivate weak var viewController: UIViewController?
    

    
    // MARK: - Public Functions
    
    public static func present(vc: UIViewController, from: UIViewController) {
        let presenter = PannableModalPresenter()
        presenter.viewController = vc
        vc.transitioningDelegate = presenter
        from.present(vc, animated: true) {
            presenter.addPanGesture(to: vc.view)
        }
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



// MARK: - Actions

extension PannableModalPresenter {
    
    func handlePanGesture(pan: UIPanGestureRecognizer) {
        guard let view = pan.view else { return }
        
        let percentThreshold: CGFloat = 0.3
        
        let translation = pan.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        switch pan.state {
        case .began:
            transition.hasStarted = true
            viewController?.dismiss(animated: true, completion: nil)
        case .changed:
            transition.shouldFinish = progress > percentThreshold
            transition.update(progress)
        case .cancelled:
            transition.hasStarted = false
            transition.cancel()
        case .ended:
            transition.hasStarted = false
            transition.shouldFinish ? transition.finish() : transition.cancel()
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
}



// MARK: - PannableModalDismissAnimatorDelegate

extension PannableModalPresenter: PannableModalDismissAnimatorDelegate {
    
    func dismissAnimatorDidDismiss(_ animator: PannableModalDismissAnimator) {
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
