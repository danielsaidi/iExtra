//
//  FilteredDirectoryFileManagerTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class FilteredDirectoryFileManagerTests: QuickSpec {
    
    override func spec() {
        
        describe("default book file manager") {
            
            var fileManager: TestFileManager!
            let url1 = URL(string: "http://test/foo.mp3")!
            let url2 = URL(string: "http://test/bar.txt")!
            let url3 = URL(string: "http://test/baz.pdf")!
            var manager: FilteredDirectoryFileManager!
            
            beforeEach {
                fileManager = TestFileManager()
                fileManager.contentsOfDirectory = [url1, url2, url3]
                manager = FilteredDirectoryFileManager(directory: .documentDirectory, fileExtensions: ["mp3", "bar", "pdf"], fileManager: fileManager)
            }
            
            
            context("when getting file names") {
                
                it("returns file names with valid extensions") {
                    let fileNames = manager.getFileNames()
                    expect(fileNames.count).to(equal(2))
                    expect(fileNames.first).to(equal(url1.lastPathComponent))
                    expect(fileNames.last).to(equal(url3.lastPathComponent))
                }
            }
            
            
            context("when getting file names matching pattern") {
                
                it("returns matching file names with valid extensions") {
                    let fileNames = manager.getFileNames(matching: ["foo"])
                    expect(fileNames.count).to(equal(1))
                    expect(fileNames.first).to(equal(url1.lastPathComponent))
                }
            }
        }
    }
}



fileprivate class TestFileManager: AppFileManager {
    
    var contentsOfDirectory = [URL]()
    
    func createFile(at url: URL, contents: Data?) -> Bool { return true }
    func fileExists(at url: URL) -> Bool { return false }
    func getAttributesForFile(at url: URL) -> [FileAttributeKey : Any]? { return nil }
    
    func getContentsOfDirectory(at url: URL) -> [URL] {
        return contentsOfDirectory
    }
    
    func getSizeOfFile(at url: URL) -> UInt64? { return 1 }
    func removeFile(at url: URL) -> Bool { return true }
}
