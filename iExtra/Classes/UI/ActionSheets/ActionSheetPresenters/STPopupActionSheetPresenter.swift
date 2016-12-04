//
//  STPopupActionSheetPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class presents action sheets, using STPopup. The
 presenter automatically switches over to a popup when
 used on an iPad and the from view is nil, and a popover
 
 
 Since I don't want this lib to require any other pods,
 I have commented out all code in this class, since it
 uses the STPopup pod. To use this presenter in an app,
 just add the STPopup pod then copy and uncomment this
 class into your own projects.
 
 */

//import UIKit
//import STPopup
//
//class STPopupActionSheetPresenter: NSObject, ActionSheetPresenter {
//    
//    
//    // MARK: - Functions
//    
//    func dismiss(sheet: ActionSheet) {
//        sheet.popupController?.dismiss()
//    }
//    
//    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?) {
//        guard !willUsePopover(for: sheet, in: vc, from: view) else { return }
//        applySize(for: sheet)
//        let popup = self.popup(for: sheet)
//        applyBackgroundTap(for: popup)
//        applyShadow(for: popup)
//        popup.present(in: vc)
//    }
//}
//
//
//
//// MARK: - Private Properties
//
//fileprivate extension STPopupActionSheetPresenter {
//    
//    var isPad: Bool {
//        return !isPhone
//    }
//    
//    var isPhone: Bool {
//        return UIDevice.current.userInterfaceIdiom == .phone
//    }
//}
//
//
//
//// MARK: - Dismiss Extension
//
//extension STPopupController {
//    func dismissOnTap(tap: UITapGestureRecognizer) {
//        dismiss()
//    }
//}
//
//
//
//// MARK: - Private Functions
//
//fileprivate extension STPopupActionSheetPresenter {
//    
//    func applyBackgroundTap(for popup: STPopupController) {
//        let selector = #selector(popup.dismissOnTap)
//        let tap = UITapGestureRecognizer(target: popup, action: selector)
//        popup.backgroundView.addGestureRecognizer(tap)
//    }
//    
//    func applyShadow(for popup: STPopupController) {
//        let layer = popup.containerView.layer
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 0)
//        layer.shadowRadius = 3
//        layer.shadowOpacity = 0.3
//    }
//    
//    func applySize(for sheet: ActionSheet) {
//        let screen = UIScreen.main.bounds.size
//        let iPadWidth = CGFloat(sheet.ipadAlertWidth)
//        let portraitWidth = isPhone ? screen.width : iPadWidth
//        let landscapeWidth = isPhone ? screen.height : iPadWidth
//        let height = max(CGFloat(sheet.contentHeight), 10)
//        let portraitSize = CGSize(width: portraitWidth, height: height)
//        let landscapeSize = CGSize(width: landscapeWidth, height: height)
//        sheet.contentSizeInPopup = portraitSize
//        sheet.landscapeContentSizeInPopup = landscapeSize
//    }
//    
//    func popup(for sheet: ActionSheet) -> STPopupController {
//        guard let popup = STPopupController(rootViewController: sheet) else {
//            fatalError("Could not create an STPopupController instance")
//        }
//        popup.style = isPhone ? .bottomSheet : .formSheet
//        popup.transitionStyle = isPhone ? .slideVertical : .fade
//        popup.navigationBarHidden = true
//        return popup
//    }
//    
//    func willUsePopover(for sheet: ActionSheet, in vc: UIViewController, from view: UIView?) -> Bool {
//        guard isPad && view != nil else { return false }
//        sheet.presenter = PopoverActionSheetPresenter()
//        sheet.presenter.present(sheet: sheet, in: vc, from: view)
//        return true
//    }
//}
