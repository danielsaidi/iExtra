//
//  Set+Group.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Set {
    
    func group<T>(_ grouper: (Element) -> T) -> [T: [Element]] {
        return Array(self).group(grouper)
    }
}
