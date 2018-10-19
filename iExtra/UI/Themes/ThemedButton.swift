//
//  ThemedButton.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This class can be used to easily apply custom button themes.
 Instead of overriding its initializers, just override setup.
 
 */

import UIKit
import Foundation

open class ThemedButton: UIButton {
    
    
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open func setup() { }
    
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        updateAppearance()
    }
    
    
    // MARK: - Appearance
    
    @objc open dynamic var disabledBackgroundColor: UIColor?
    
    @objc open dynamic var highlightedBackgroundColor: UIColor?
    
    @objc open dynamic var normalBackgroundColor: UIColor? {
        didSet { backgroundColor = normalBackgroundColor }
    }
    
    @objc open dynamic var themedFont: UIFont? {
        get { return titleLabel?.font }
        set { titleLabel?.font = newValue }
    }
    
    
    // MARK: - Properties
    
    open var backgroundColorForCurrentState: UIColor? {
        if isDisabled, let color = disabledBackgroundColor { return color }
        if isHighlighted, let color = highlightedBackgroundColor { return color }
        return normalBackgroundColor ?? backgroundColor
    }
    
    open override var isEnabled: Bool {
        didSet { updateAppearance() }
    }
    
    open var isDisabled: Bool {
        return !isEnabled || isSoftDisabled
    }
    
    open override var isHighlighted: Bool {
        didSet { updateAppearance() }
    }
    
    open var isSoftDisabled: Bool = false {
        didSet { updateAppearance() }
    }
    
    fileprivate var allStates: [UIControl.State] {
        return [.normal, .highlighted, .disabled]
    }
    
    
    // MARK: - Public Functions
    
    open func updateAppearance() {
        backgroundColor = backgroundColorForCurrentState
    }
}
