//
//  Array_RandomElement.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-09.
//  Copyright © 2016 Appamini. All rights reserved.
//

import Foundation

public extension Array {
    
    public func randomElement<T>() -> T? {
        let elements = self.elements(ofType: T.self)
        guard elements.count > 0 else { return nil }
        let index = Int.random(in: 0...(elements.count-1))
        return elements[index]
    }
}
