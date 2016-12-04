//
//  Array_Group.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-06-17.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Array {
    
    public func group<T>(_ grouper: (Element) -> T) -> [T : [Element]] {
        var result = [T : [Element]]()
        for obj in self {
            let index = grouper(obj)
            if (result[index] == nil) {
                result[index] = [Element]()
            }
            result[index]?.append(obj as Element)
        }
        return result
    }
}
