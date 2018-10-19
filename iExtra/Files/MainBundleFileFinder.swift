//
//  MainBundleFileFinder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public class MainBundleFileFinder: FileFinder {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: - Public Functions
    
    public func findFiles(withPrefix prefix: String) -> [String] {
        let format = "self BEGINSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [prefix])
        return findFiles(with: predicate)
    }
    
    public func findFiles(withSuffix suffix: String) -> [String] {
        let format = "self ENDSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [suffix])
        return findFiles(with: predicate)
    }
}


private extension MainBundleFileFinder {
    
    func findFiles(with predicate: NSPredicate) -> [String] {
        let path = Bundle.main.bundlePath
        let fileManager = FileManager.default
        do {
            let files = try fileManager.contentsOfDirectory(atPath: path) as NSArray
            return files.filtered(using: predicate).compactMap { $0 as? String }
        } catch {
            return []
        }
    }
}
