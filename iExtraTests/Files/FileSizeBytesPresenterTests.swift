//
//  FileSizeBytesPresenterTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class FileSizeBytesPresenterTests: QuickSpec {
    
    override func spec() {
        
        describe("file size bytes presenter") {
            
            let presenter = FileSizeBytesPresenter()
            
            it("uses bytes for zero bytes file size") {
                expect(presenter.fileSizeDescription(for: 0)).to(equal("0 bytes"))
            }
            
            it("uses bytes for one byte file size") {
                expect(presenter.fileSizeDescription(for: 1)).to(equal("1 byte"))
            }
            
            it("uses bytes for file sizes greater than one byte") {
                expect(presenter.fileSizeDescription(for: 2)).to(equal("2 bytes"))
                expect(presenter.fileSizeDescription(for: 1024)).to(equal("1024 bytes"))
                expect(presenter.fileSizeDescription(for: 10241024)).to(equal("10241024 bytes"))
            }
        }
    }
}
