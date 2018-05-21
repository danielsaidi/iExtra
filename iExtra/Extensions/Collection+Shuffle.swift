//
//  Collection+Shuffle.swift
//  Created by Nate Cook on 2016-12-13.
//  Copyright © 2016 Nate Cook. All rights reserved.
//
//  Link: http://stackoverflow.com/questions/24026510/how-do-i-shuffle-an-array-in-swift
//

import Foundation

public extension MutableCollection {
    
    public mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            self.swapAt(firstUnshuffled, i)
        }
    }
}

public extension Sequence {
    
    public func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
