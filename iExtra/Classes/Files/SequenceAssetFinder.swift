//
//  SequenceAssetFinder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-04-04.
//  Copyright © 2016 Appamini. All rights reserved.
//

/*
 This class can only be used with asset images that
 has a numeric suffix that increments by one. It is
 setup with a start index (default 1) then tries to
 load an image per new, incremented index. Whenever
 an image can not be found for the current index, a
 list with all found images is returned.
 */

import UIKit

open class SequenceAssetFinder: NSObject, FileFinder {
    
    
    // MARK: Initialization
    
    public init(startIndex: Int = 1, separator: String = "-") {
        self.startIndex = startIndex
        self.separator = separator
        super.init()
    }
    
    
    
    // MARK: Properties
    
    fileprivate var separator: String
    fileprivate var startIndex: Int
    
    
    
    // MARK: Public functions
    
    public func findFiles(withPrefix prefix: String) -> [String] {
        var result = [String]()
        var index = startIndex
        while(true) {
            let name = "\(prefix)\(separator)\(index)"
            let image = UIImage(named: name)
            if (image == nil) { return result }
            result.append(name)
            index += 1
        }
    }
    
    public func findFiles(withSuffix suffix: String) -> [String] {
        return [String]()
    }
}
