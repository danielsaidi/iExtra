//
//  PopoverActionSheetPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This presenter will present action sheets as popovers,
 just as regular UIAlertControllers are displayed when
 being displayed in actionsheet mode on an iPad.
 
 Only use this presenter when you know that you are on
 an iPad or when the UI can display popover on iPhones.
 
 */

import UIKit
import iExtra

open class PopoverActionSheetPresenter: NSObject, ActionSheetPresenter {
    
    
    // MARK: - Public functions
    
    open func dismiss(sheet: ActionSheet) {
        sheet.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    open func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
        applySize(for: sheet)
        let popover = self.popover(for: sheet)
        setup(popover: popover, for: view)
        vc.present(sheet, animated: true, completion: nil)
    }
}



// MARK: - Private Functions

fileprivate extension PopoverActionSheetPresenter {
    
    func applySize(for sheet: ActionSheet) {
        let width = CGFloat(sheet.ipadAlertWidth)
        let height = max(CGFloat(sheet.contentHeight), 10)
        let size = CGSize(width: width, height: height)
        sheet.preferredContentSize = size
    }
    
    func popover(for sheet: ActionSheet) -> UIPopoverPresentationController {
        sheet.modalPresentationStyle = .popover
        guard let popover = sheet.popoverPresentationController else {
            fatalError("Could not create a PopoverPresentationController instance")
        }
        popover.backgroundColor = sheet.view.backgroundColor
        return popover
    }
    
    func setup(popover: UIPopoverPresentationController, for view: UIView?) {
        guard let view = view else { return }
        popover.sourceView = view
        let bounds = view.bounds
        var center = bounds.origin
        center.x += bounds.size.width / 2
        center.y += bounds.size.height / 2
        popover.sourceRect = CGRect(x: center.x, y: center.y, width: 1, height: 1)
    }
}
