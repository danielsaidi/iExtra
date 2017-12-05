//
//  AppFileManager.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol AppFileManager: class {
    
    func createFile(at url: URL, contents: Data?) -> Bool
    func fileExists(at url: URL) -> Bool
    func getAttributesForFile(at url: URL) -> [FileAttributeKey : Any]?
    func getContentsOfDirectory(at url: URL) -> [URL]
    func getSizeOfFile(at url: URL) -> UInt64?
    func removeFile(at url: URL) -> Bool
}
