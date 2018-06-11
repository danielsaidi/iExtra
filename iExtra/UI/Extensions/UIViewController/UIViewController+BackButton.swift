//
//  UIViewController+BackButton.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-06-03.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

//  TODO: Remove this once I manage to achieve better image
//  alignment using the standard appearance approach.

import UIKit

public extension UIViewController {
    
    func addCustomBackButton(withImage image: UIImage, insets: UIEdgeInsets) {
        guard let nvc = navigationController else { return }
        guard nvc.viewControllers.first != self else { return }
        let image = image.withAlignmentRectInsets(insets)
        let action = #selector(backButtonTapped)
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        navigationItem.leftBarButtonItem = button
        setupBackBarButtonAccessibility(for: button)
    }
    
    @objc func backButtonTapped() {
        _ = navigationController?.popViewController(animated: true)
    }
}


private extension UIViewController {
    
    func setupBackBarButtonAccessibility(for button: UIBarButtonItem) {
        button.accessibilityTraits = UIAccessibilityTraitButton
        button.accessibilityLabel = ""// L10n.generalBack.string
    }
}
