//
//  FloatingMenuPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-11.
//  Copyright (c) 2014 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol FloatingMenuPresenter {
    
    func present(menu: FloatingMenu, completion: @escaping (() ->()))
}
