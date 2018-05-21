//
//  DirectoryFileManager.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2018 Daniel Saidi. All rights reserved.

import Foundation

public protocol DirectoryFileManager: class {
    
    var directory: URL { get }
    
    func createFile(named name: String, contents: Data?) -> Bool
    func fileExists(named name: String) -> Bool
    func getAttributesForFile(named name: String) -> [FileAttributeKey: Any]?
    func getExistingFileNames(in collection: [String]) -> [String]
    func getFileNames() -> [String]
    func getFileNames(matching fileNamePatterns: [String]) -> [String]
    func getNonExistingFileNames(in collection: [String]) -> [String]
    func getSizeOfFile(named name: String) -> UInt64?
    func getSizeOfFiles() -> UInt64
    func getUrlForFile(named name: String) -> URL?
    func getUnreferencedFileNames(forReferences refs: [String]) -> [String]
    func removeFile(named name: String) -> Bool
}
