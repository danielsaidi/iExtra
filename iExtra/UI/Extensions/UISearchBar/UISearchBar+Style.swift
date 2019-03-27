//
//  UISearchBar+Style.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UISearchBar {
    
    
    // MARK: - Properties
    
    var textField: UITextField? {
        return getViewElement(type: UITextField.self)
    }
    
    
    // MARK: - Functions
    
    func setTextFieldColor(_ color: UIColor) {
        guard let textField = self.textField else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 6
        case .prominent, .default:
            textField.backgroundColor = color
        @unknown default:
            assert(false, "Unsupported case")
        }
    }
    
    func setTextFieldClearButtonColor(_ color: UIColor) {
        guard
            let textField = self.textField,
            let button = textField.value(forKey: "clearButton") as? UIButton,
            let image = button.imageView?.image
            else { return }
        let tinted = image.tinted(with: color, blendMode: .normal)
        button.setImage(tinted, for: .normal)
    }
    
    func setTransparentBackground() {
        setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
    
    
    func setSearchImageColor(color: UIColor) {
        guard
            let imageView = self.textField?.leftView as? UIImageView,
            let image = imageView.image else { return }
        let tinted = image.tinted(with: color, blendMode: .normal)
        imageView.image = tinted
    }
}


// MARK: - Private Functions

private extension UISearchBar {
    
    func getViewElement<T>(type: T.Type) -> T? {
        let svs = subviews.flatMap { $0.subviews }
        guard let element = (svs.filter { $0 is T }).first as? T else { return nil }
        return element
    }
}
