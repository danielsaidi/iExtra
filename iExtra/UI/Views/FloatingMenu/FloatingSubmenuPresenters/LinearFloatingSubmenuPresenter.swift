//
//  LinearFloatingSubmenuPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-11.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 This presenter presents submenus by expanding in any linear
 direction.
 
*/

import UIKit

public enum LinearFloatingSubmenuPresenterDirection {
    case up
    case down
    case left
    case right
}

open class LinearFloatingSubMenuPresenter: NSObject, FloatingSubmenuPresenter {
    
    
    // MARK: Initialization
    
    public init(direction: LinearFloatingSubmenuPresenterDirection) {
        self.direction = direction
        super.init()
    }
    
    
    // MARK: Properties
    
    open var direction: LinearFloatingSubmenuPresenterDirection
    open var presentationDuration = 0.3
    open var offsetMultiplier = 1.4
    
    
    // MARK: Public Functions
    
    open func dismiss(submenu: FloatingSubmenu, in menu: FloatingMenu) {
        for button in submenu.buttons {
            removeLabelsFromSuperview(button.subviews)
            
            let point = getDismissPoint(forButton: button, inMenu: menu)
            let animations = { button.center = point }
            UIView.animate(withDuration: presentationDuration, animations: animations) { _ in
                button.isHidden = true
            }
        }
    }
    
    open func present(submenu: FloatingSubmenu, in menu: FloatingMenu) {
        let buttons = submenu.buttons
        let offsets = getPresentationOffsets(forButtons: buttons, inMenu: menu)
        for button in buttons {
            button.isHidden = false
            guard let offsetIndex = buttons.firstIndex(of: button) else { break }
            let offset = offsets[offsetIndex]
            presentButton(button, usingOffset: offset)
        }
    }
}


// MARK: Private Functions

private extension LinearFloatingSubMenuPresenter {
    
    func applyShadow(on label: UILabel, from button: UIButton) {
        label.layer.shadowOffset = button.layer.shadowOffset
        label.layer.shadowRadius = button.layer.shadowRadius
        label.layer.shadowOpacity = button.layer.shadowOpacity
        label.layer.shouldRasterize = button.layer.shouldRasterize
        label.layer.rasterizationScale = button.layer.rasterizationScale
    }
    
    func delay(seconds: TimeInterval, function: @escaping ()->()) {
        let milliseconds = Int(seconds * 1000)
        let interval: DispatchTimeInterval = .milliseconds(milliseconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: function)
    }
    
    func presentButton(_ button: UIButton, usingOffset offset: CGFloat) {
        let center = button.center
        let animation = CAKeyframeAnimation()
        animation.duration = presentationDuration
        animation.isRemovedOnCompletion = true
        
        switch direction {
        case .up, .down:
            let y = button.center.y
            animation.keyPath = "position.y"
            animation.values = [y, y + 1.3 * offset, y + 1.0 * offset]
            button.center = CGPoint(x: center.x, y: center.y + offset)
            button.layer.add(animation, forKey: "position.y")
        case .left, .right:
            let x = button.center.x
            animation.keyPath = "position.x"
            animation.values = [x, x + 1.3 * offset, x + 1.0 * offset]
            button.center = CGPoint(x: center.x + offset, y: center.y)
            button.layer.add(animation, forKey: "position.x")
        }
        
        delay(seconds: 3 * presentationDuration) {
            self.presentLabel(forButton: button)
        }
    }
    
    func getDismissPoint(forButton button: UIButton, inMenu menu: FloatingMenu) -> CGPoint {
        switch direction {
        case .up, .down: return CGPoint(x: button.center.x, y: menu.primaryButton.center.y)
        case .left, .right: return CGPoint(x: menu.primaryButton.center.x, y: button.center.y)
        }
    }
    
    func getPresentationOffsets(forButtons buttons: [UIButton], inMenu menu: FloatingMenu) -> [CGFloat] {
        var multiplier = CGFloat(offsetMultiplier)
        if direction == .up || direction == .left {
            multiplier = -multiplier
        }
        
        var result = [CGFloat]()
        var offset = multiplier * menu.primaryButton.frame.size.height
        for button in buttons {
            result.append(offset)
            offset += multiplier * button.frame.size.height
        }
        
        return result
    }
    
    func presentLabel(forButton button: UIButton) {
        switch direction {
        case .up, .down:
            let buttonSize = button.frame.size
            let labelSize = CGSize(width: 1000, height: buttonSize.height)
            let label = UILabel()
            let translationKey = button.accessibilityLabel ?? ""
            label.text = NSLocalizedString(translationKey, comment: "")
            label.alpha = 0.0
            label.textColor = UIColor.white
            UIView.animate(withDuration: 1, animations: { label.alpha = 1 })
            label.frame = CGRect(x: 1.35 * buttonSize.width, y: 0, width: labelSize.width, height: labelSize.height)
            applyShadow(on: label, from: button)
            button.addSubview(label)
        case .left, .right: break
        }
    }
    
    func removeLabelsFromSuperview(_ subviews: [UIView]) {
        for view in subviews {
            if view.isKind(of: UILabel.self) {
                view.removeFromSuperview()
            }
        }
    }
}
