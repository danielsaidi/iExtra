//
//  FloatingMenuBackgroundPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-11.
//  Copyright © 2014 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol FloatingMenuBackgroundPresenter {
    
    func hideBackground(for menu: FloatingMenu)
    func presentBackground(for menu: FloatingMenu)
}
