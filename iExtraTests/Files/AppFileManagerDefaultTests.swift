//
//  AppFileManagerDefaultTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class AppFileManagerDefaultTests: QuickSpec {
    
    override func spec() {
        
        describe("default global file manager") {
            
            var manager = AppFileManagerDefault()
            let directory = FileManager.SearchPathDirectory.documentDirectory
            let directoryUrl = FileManager.default.urls(for: directory, in: .userDomainMask).last!
            let fileNames = ["file1", "file2"]
            
            func createFiles() {
                fileNames.forEach { let _ = manager.createFile(at: url(for: $0), contents: nil) }
            }
            
            func createFile(named name: String, contents: Data?) -> Bool {
                return manager.createFile(at: url(for: name), contents: contents)
            }
            
            func url(for fileName: String) -> URL {
                return directoryUrl.appendingPathComponent(fileName)
            }
            
            afterEach {
                fileNames.forEach { let _ = manager.removeFile(at: url(for: $0)) }
            }
            
            
            
            context("document folder url") {
                
                it("is resolved for test simulator") {
                    let simulatorPattern = "Library/Developer/CoreSimulator/Devices"
                    let simulatorMatch = directoryUrl.path.contains(simulatorPattern)
                    let devicePattern = "/var/mobile/Containers"
                    let deviceMatch = directoryUrl.path.contains(devicePattern)
                    let match = simulatorMatch || deviceMatch
                    
                    expect(match).to(beTrue())
                }
            }
            
            
            context("when creating files") {
                
                it("can create empty file") {
                    let name = "file1"
                    let didCreate = createFile(named: name, contents: nil)
                    expect(didCreate).to(beTrue())
                }
                
                it("can create non-empty file") {
                    let name = "file1"
                    let didCreate = createFile(named: name, contents: Data())
                    expect(didCreate).to(beTrue())
                }
            }
            
            
            context("when checking if files exists") {
                
                it("finds existing file") {
                    createFiles()
                    let exists = manager.fileExists(at: url(for: "file1"))
                    expect(exists).to(beTrue())
                }
                
                it("does not find non-existing file") {
                    let exists = manager.fileExists(at: url(for: "file1"))
                    expect(exists).to(beFalse())
                }
            }
            
            
            context("when getting attributes of file") {
                
                it("returns nil if file does not exist") {
                    let url = URL(string: "file:///foo/bar")!
                    let attributes = manager.getAttributesForFile(at: url)
                    expect(attributes).to(beNil())
                }
                
                it("returns attributes if file exists") {
                    createFiles()
                    let attributes = manager.getAttributesForFile(at: url(for: "file1"))
                    expect(attributes).toNot(beNil())
                }
                
                it("returns valid attributes if file exists") {
                    createFiles()
                    let attributes = manager.getAttributesForFile(at: url(for: "file1"))!
                    let attribute = attributes[FileAttributeKey.size] as? NSNumber
                    expect(attribute).to(equal(0))
                }
            }
            
            
            context("when getting content of folder") {
                
                it("returns urls for existing files") {
                    createFiles()
                    let urls = manager.getContentsOfDirectory(at: directoryUrl)
                    let fileNames = urls.map { $0.lastPathComponent }
                    expect(urls.count).to(equal(3))
                    expect(fileNames).to(contain("file1"))
                    expect(fileNames).to(contain("file2"))
                }
                
                it("returns no urls for no existing files") {
                    let urls = manager.getContentsOfDirectory(at: directoryUrl)
                    expect(urls.count).to(equal(1))
                }
            }
            
            
            context("when getting size of file") {
                
                it("returns nil if file does not exist") {
                    let url = URL(string: "file:///foo/bar")!
                    let size = manager.getSizeOfFile(at: url)
                    expect(size).to(beNil())
                }
                
                it("returns zero size if empty file exists") {
                    createFiles()
                    let size = manager.getSizeOfFile(at: url(for: "file1"))
                    expect(size).to(equal(0))
                }
                
                it("returns non-zero size if empty file exists") {
                    let content = "content".data(using: .utf8)
                    let _ = createFile(named: "file1", contents: content)
                    let size = manager.getSizeOfFile(at: url(for: "file1"))
                    expect(size).to(equal(7))
                }
            }
            
            
            context("when removing file") {
                
                it("can remove existing file") {
                    createFiles()
                    let didRemove = manager.removeFile(at: url(for: "file1"))
                    expect(didRemove).to(beTrue())
                }
                
                it("can not remove non-existing file") {
                    let didRemove = manager.removeFile(at: url(for: "file1"))
                    expect(didRemove).to(beFalse())
                }
            }
        }
    }
}

