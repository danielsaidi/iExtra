//
//  ActionSheetPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-25.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol ActionSheetPresenter: class {
    
    func dismiss(sheet: ActionSheet)
    func present(sheet: ActionSheet, in vc: UIViewController, from view: UIView?)
}
