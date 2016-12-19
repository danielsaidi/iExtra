//
//  DirectoryFileManagerDefaultTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class DirectoryFileManagerDefaultTests: QuickSpec {
    
    override func spec() {
        
        describe("default application file manager") {
            
            var manager: DirectoryFileManager!
            let fileNames = ["file1", "file2"]
            
            
            func createFiles() {
                fileNames.forEach { let _ = manager.createFile(withName: $0, contents: nil) }
            }
            
            
            beforeEach {
                manager = DirectoryFileManagerDefault(searchPathDirectory: .documentDirectory)
            }
            
            afterEach {
                fileNames.forEach { let _ = manager.removeFile(at: manager.directory.appendingPathComponent($0)) }
            }
            
            
            
            context("document folder url") {
                
                it("is resolved for test simulator") {
                    let simulatorPattern = "Library/Developer/CoreSimulator/Devices"
                    let simulatorMatch = manager.directory.path.contains(simulatorPattern)
                    let devicePattern = "/var/mobile/Containers"
                    let deviceMatch = manager.directory.path.contains(devicePattern)
                    let match = simulatorMatch || deviceMatch
                    
                    expect(match).to(beTrue())
                }
            }
            
            
            context("when creating files") {
                
                it("can create empty file") {
                    let name = "file1"
                    let didCreate = manager.createFile(withName: name, contents: nil)
                    expect(didCreate).to(beTrue())
                }
                
                it("can create non-empty file") {
                    let name = "file1"
                    let didCreate = manager.createFile(withName: name, contents: Data())
                    expect(didCreate).to(beTrue())
                }
            }
            
            
            context("when checking if files exists at url") {
                
                it("finds existing file") {
                    createFiles()
                    let url = manager.directory.appendingPathComponent("file1")
                    let exists = manager.fileExists(at: url)
                    expect(exists).to(beTrue())
                }
                
                it("does not find non-existing file") {
                    let url = manager.directory.appendingPathComponent("file1")
                    let exists = manager.fileExists(at: url)
                    expect(exists).to(beFalse())
                }
            }
            
            
            context("when getting attributes of file at url") {
                
                it("returns nil if file does not exist") {
                    let url = URL(string: "file:///foo/bar")!
                    let attributes = manager.getAttributesForFile(at: url)
                    
                    expect(attributes).to(beNil())
                }
                
                it("returns attributes if file exists") {
                    createFiles()
                    let url = manager.getUrlForFile(withName: "file1")!
                    let attributes = manager.getAttributesForFile(at: url)
                    
                    expect(attributes).toNot(beNil())
                }
                
                it("returns valid attributes if file exists") {
                    createFiles()
                    let url = manager.getUrlForFile(withName: "file1")!
                    let attributes = manager.getAttributesForFile(at: url)!
                    let attribute = attributes[FileAttributeKey.size] as! UInt64
                    expect(attribute).to(equal(0))
                }
            }
            
            
            context("when getting invalid file pointers") {
                
                it("returns no pointers if all files exist") {
                    createFiles()
                    let pointers = [TestPointer("file1"), TestPointer("file2")]
                    let result = manager.getInvalidFilePointers(in: pointers)
                    
                    expect(result.count).to(equal(0))
                }
                
                it("returns all pointers if no files exist") {
                    let pointers = [TestPointer("file1"), TestPointer("file2")]
                    let result = manager.getInvalidFilePointers(in: pointers)
                    let fileNames = result.map { $0.fileName }
                    
                    expect(result.count).to(equal(2))
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns some pointers if some files exist") {
                    createFiles()
                    let pointers = [TestPointer("file1"), TestPointer("foo")]
                    let result = manager.getInvalidFilePointers(in: pointers)
                    
                    expect(result.count).to(equal(1))
                    expect(result.first!.fileName).to(equal("foo"))
                }
            }
            
            
            context("when getting file urls") {
                
                it("returns urls for existing files") {
                    createFiles()
                    let urls = manager.getFileUrls()
                    let fileNames = urls.map { $0.lastPathComponent }
                    expect(urls.count).to(equal(2))
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns no urls for no existing files") {
                    let urls = manager.getFileUrls()
                    expect(urls.count).to(equal(0))
                }
            }
            
            
            context("when getting file urls matching pattern") {
                
                it("returns single match if single file matches single pattern") {
                    createFiles()
                    let urls = manager.getFileUrls(matching: ["file1"])
                    let fileNames = urls.map { $0.lastPathComponent }
                    expect(urls.count).to(equal(1))
                    expect(fileNames).to(contain("file1"))
                }
                
                it("returns multiple matches if multiple files match single pattern") {
                    createFiles()
                    let urls = manager.getFileUrls(matching: ["file"])
                    let fileNames = urls.map { $0.lastPathComponent }
                    expect(urls.count).to(equal(2))
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns single match if single file matches multiple patterns") {
                    createFiles()
                    let urls = manager.getFileUrls(matching: ["file1", "foo"])
                    let fileNames = urls.map { $0.lastPathComponent }
                    expect(urls.count).to(equal(1))
                    expect(fileNames).to(contain("file1"))
                }
                
                it("returns multiple matches if multiple files match multiple patterns") {
                    createFiles()
                    let urls = manager.getFileUrls(matching: ["file1", "file2"])
                    let fileNames = urls.map { $0.lastPathComponent }
                    expect(urls.count).to(equal(2))
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns case insensitive matches") {
                    createFiles()
                    let urls = manager.getFileUrls(matching: ["fiLe1", "FilE2"])
                    let fileNames = urls.map { $0.lastPathComponent }
                    expect(urls.count).to(equal(2))
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns no match if no files matches single pattern") {
                    createFiles()
                    let urls = manager.getFileUrls(matching: ["foo"])
                    expect(urls.count).to(equal(0))
                }
                
                it("returns no match if no files matches multiple pattern") {
                    let urls = manager.getFileUrls(matching: ["foo", "bar"])
                    expect(urls.count).to(equal(0))
                }
            }
            
            
            context("when getting size of file at url") {
                
                it("returns nil if file does not exist") {
                    let url = URL(string: "file:///foo/bar")!
                    let size = manager.getSizeOfFile(at: url)
                    
                    expect(size).to(beNil())
                }
                
                it("returns zero size if empty file exists") {
                    createFiles()
                    let url = manager.getUrlForFile(withName: "file1")!
                    let size = manager.getSizeOfFile(at: url)
                    
                    expect(size).to(equal(0))
                }
                
                it("returns non-zero size if empty file exists") {
                    let fileName = fileNames.first!
                    let content = "content".data(using: .utf8)
                    let _ = manager.createFile(withName: fileName, contents: content)
                    let url = manager.getUrlForFile(withName: fileName)!
                    let size = manager.getSizeOfFile(at: url)
                    
                    expect(size).to(equal(7))
                }
            }
            
            
            context("when getting unreferenced file urls") {
                
                it("returns no files if all files are referred") {
                    createFiles()
                    let pointers = fileNames.map { TestPointer($0) }
                    let result = manager.getUnreferencedFilesUrls(for: pointers)
                    
                    expect(result.count).to(equal(0))
                }
                
                it("returns all files if no file is referred") {
                    createFiles()
                    let pointers = [TestPointer("foo.mp3")]
                    let result = manager.getUnreferencedFilesUrls(for: pointers)
                    
                    expect(result.count).to(equal(fileNames.count))
                    let fileNames = result.map { $0.lastPathComponent }
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns some files if some files are referred") {
                    createFiles()
                    let pointers = [TestPointer("foo.mp3"), TestPointer("file2")]
                    let result = manager.getUnreferencedFilesUrls(for: pointers)
                    
                    expect(result.count).to(equal(1))
                    let fileNames = result.map { $0.lastPathComponent }
                    expect(fileNames).to(contain("file1"))
                }
            }
            
            
            context("when getting url for file") {
                
                it("returns url if file exists") {
                    createFiles()
                    let name = "file1"
                    let url = manager.getUrlForFile(withName: name)!
                    expect(url.lastPathComponent).to(equal(name))
                }
                
                it("returns no url if file does not exist") {
                    let name = "file1"
                    let url = manager.getUrlForFile(withName: name)
                    expect(url).to(beNil())
                }
            }
            
            
            context("when getting valid file pointers") {
                
                it("returns all pointers if all files exist") {
                    createFiles()
                    let pointers = [TestPointer("file1"), TestPointer("file2")]
                    let result = manager.getValidFilePointers(in: pointers)
                    let fileNames = result.map { $0.fileName }
                    
                    expect(result.count).to(equal(2))
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns no pointers if no files exist") {
                    let pointers = [TestPointer("file1"), TestPointer("file2")]
                    let result = manager.getValidFilePointers(in: pointers)
                    
                    expect(result.count).to(equal(0))
                }
                
                it("returns some pointers if some files exist") {
                    createFiles()
                    let pointers = [TestPointer("file1"), TestPointer("foo")]
                    let result = manager.getValidFilePointers(in: pointers)
                    
                    expect(result.count).to(equal(1))
                    expect(result.first!.fileName).to(equal("file1"))
                }
            }
            
            
            context("when removing file at url") {
                
                it("can remove existing file") {
                    let name = "foo"
                    let didCreate = manager.createFile(withName: name, contents: nil)
                    let url = manager.directory.appendingPathComponent(name)
                    let didRemove = manager.removeFile(at: url)
                    expect(didCreate).to(beTrue())
                    expect(didRemove).to(beTrue())
                }
                
                it("can not remove non-existing file") {
                    let name = "foo"
                    let url = manager.directory.appendingPathComponent(name)
                    let didRemove = manager.removeFile(at: url)
                    expect(didRemove).to(beFalse())
                }
            }
        }
    }
}


fileprivate class TestPointer: NSObject, FilePointer {
    
    init(_ fileName: String) {
        self.fileName = fileName
        super.init()
    }
    
    let fileName: String
}


