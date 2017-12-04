//
//  RadialFloatingMenuBackgroundPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-11.
//  Copyright © 2014 Daniel Saidi. All rights reserved.
//

/*
    This floating menu background presenter presents the
    background as a circle that grows until it fills the
    entire screen below the menu.
 */

import UIKit

open class RadialFloatingMenuBackgroundPresenter: NSObject, FloatingMenuBackgroundPresenter {
    
    
    // MARK: - Properties
    
    open var backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0.7)
    open var presentationDuration = 1.0
    
    fileprivate var backgroundView: UIView?
    fileprivate var scaleFactor = CGFloat(100.0)
    
    
    
    // MARK: - Public methods
    
    open func hideBackground(for menu: FloatingMenu) {
        guard let backgroundView = backgroundView else { return }
        
        UIView.animate(withDuration: presentationDuration / 5,
            delay: 0.0,
            options: .curveEaseOut,
            animations: {
                backgroundView.alpha = 0.0
            }, completion: { finished in
                backgroundView.removeFromSuperview()
            }
        )
    }
    
    open func presentBackground(for menu: FloatingMenu) {
        createBackground(for: menu)
        guard let backgroundView = backgroundView else { return }

        UIView.animate(withDuration: presentationDuration,
            delay: 0.0,
            options:.curveEaseOut,
            animations: {
                let factor = self.scaleFactor
                let transform = CGAffineTransform(scaleX: factor, y: factor)
                backgroundView.transform = transform
            }, completion: { finished in
            }
        )
    }
}


// MARK: - Private methods

fileprivate extension RadialFloatingMenuBackgroundPresenter {
    
    func createBackground(for menu: FloatingMenu) {
        if backgroundView != nil {
            backgroundView!.removeFromSuperview()
        }
        
        let btn = menu.primaryButton
        let bg = UIButton(type: .custom)
        bg.frame = (btn?.frame)!
        bg.layer.cornerRadius = (btn?.layer.cornerRadius)!
        bg.backgroundColor = backgroundColor
        bg.addTarget(menu, action: #selector(menu.primaryButtonTapped), for: .touchDown)
        backgroundView = bg
        
        menu.insertSubview(bg, at: 0)
    }
}
