//
//  InputStepperToolbar.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-09-23.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public class InputStepperToolbar: UIToolbar {
    
    
    // MARK: - Initialization
    
    public init(owner: UIView) {
        self.owner = owner
        super.init(frame: CGRect.zero)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    
    // MARK: - Appearance properties
    
    public static var nextImage: UIImage?
    public var nextImage: UIImage? {
        return InputStepperToolbar.nextImage
    }
    
    public static var nextTitle = "Next"
    public var nextTitle: String {
        return InputStepperToolbar.nextTitle
    }
    
    public static var previousImage: UIImage?
    public var previousImage: UIImage? {
        return InputStepperToolbar.previousImage
    }
    
    public static var previousTitle = "Previous"
    public var previousTitle: String {
        return InputStepperToolbar.previousTitle
    }
    
    
    
    // MARK: - Properties
    
    fileprivate weak var owner: UIView?
    
    fileprivate var nextButton: UIBarButtonItem!
    
    fileprivate var previousButton: UIBarButtonItem!
}


// MARK: - Calculated Properties

fileprivate extension InputStepperToolbar {
    
    var hasNext: Bool {
        guard let owner = owner else { return false }
        return stepView(withTag: owner.tag + 1) != nil
    }
    
    var hasPrevious: Bool {
        guard let owner = owner else { return false }
        guard let previous = stepView(withTag: owner.tag - 1) else { return false }
        return previous != owner.superview
    }
}


// MARK: - Selectors

@objc extension InputStepperToolbar {
    
    func doneButtonTapped() {
        resignKeyboard()
    }
    
    func nextButtonTapped() {
        stepNext()
    }
    
    func previousButtonTapped() {
        stepPrevious()
    }
}


// MARK: - Private Functions

fileprivate extension InputStepperToolbar {
    
    func createDoneButton() -> UIBarButtonItem {
        let action = #selector(doneButtonTapped)
        return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: action)
    }
    
    func createNextButton() -> UIBarButtonItem {
        let action = #selector(nextButtonTapped)
        return nextImage != nil
            ? UIBarButtonItem(image: nextImage, style: .plain, target: self, action: action)
            : UIBarButtonItem(title: nextTitle, style: .plain, target: self, action: action)
    }
    
    func createPreviousButton() -> UIBarButtonItem {
        let action = #selector(previousButtonTapped)
        return previousImage != nil
            ? UIBarButtonItem(image: previousImage, style: .plain, target: self, action: action)
            : UIBarButtonItem(title: previousTitle, style: .plain, target: self, action: action)
    }
    
    func refresh() {
        nextButton?.isEnabled = hasNext
        previousButton?.isEnabled = hasPrevious
    }
    
    func setup() {
        guard let view = owner?.superview else { return }
        
        frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        
        nextButton = createNextButton()
        previousButton = createPreviousButton()
        let doneButton = createDoneButton()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        items = [previousButton, nextButton, space, doneButton]
        
        refresh()
    }
    
    func stepView(withTag tag: Int) -> UIView? {
        return owner?.superview?.viewWithTag(tag)
    }
    
    func setFirstResponder(withTag tag: Int) {
        if let view = stepView(withTag: tag) {
            view.becomeFirstResponder()
        }
        refresh()
    }
}


// MARK: - Actions

extension InputStepperToolbar {
    
    func stepNext() {
        guard let owner = owner else { return }
        setFirstResponder(withTag: owner.tag + 1)
    }
    
    func stepPrevious() {
        guard let owner = owner else { return }
        setFirstResponder(withTag: owner.tag - 1)
    }
    
    func resignKeyboard() {
        owner?.superview?.endEditing(true)
    }
}
