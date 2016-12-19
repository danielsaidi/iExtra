//
//  DirectoryFileManager.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol DirectoryFileManager: class {
    
    var directory: URL { get }
    
    func createFile(withName name: String, contents: Data?) -> Bool
    func fileExists(at url: URL) -> Bool
    func getAttributesForFile(at url: URL) -> [FileAttributeKey : Any]?
    func getInvalidFilePointers(in collection: [FilePointer]) -> [FilePointer]
    func getFileUrls() -> [URL]
    func getFileUrls(matching fileNamePatterns: [String]) -> [URL]
    func getSizeOfFile(at url: URL) -> UInt64?
    func getUnreferencedFilesUrls(for pointers: [FilePointer]) -> [URL]
    func getUrlForFile(withName name: String) -> URL?
    func getValidFilePointers(in collection: [FilePointer]) -> [FilePointer]
    func removeFile(at url: URL) -> Bool
}
