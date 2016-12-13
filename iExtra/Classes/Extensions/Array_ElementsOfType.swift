//
//  Array_ElementsOfType.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-09.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation


public extension Array {
    
    public func elements<T>(ofType: T.Type) -> [T] {
        return filter({ $0 is T }).map({ $0 as! T })
    }
}
