//
//  Array+RemoveObject.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Array where Element : Equatable {
    
    public mutating func remove(object: Element) {
        guard let index = self.index(of: object) else { return }
        remove(at: index)
    }
}
