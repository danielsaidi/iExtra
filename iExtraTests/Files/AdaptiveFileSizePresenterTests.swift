//
//  AdaptiveFileSizePresenterTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class AdaptiveFileSizePresenterTests: QuickSpec {

    override func spec() {
        
        describe("adaptive file size presenter") {
            
            let presenter = AdaptiveFileSizePresenter()
            
            func text(for size: UInt64) -> String {
                return presenter.fileSizeDescription(for: size)
            }
            
            it("uses bytes for zero bytes file size") {
                expect(text(for: 0)).to(equal("0 bytes"))
            }
            
            it("uses bytes for one byte file size") {
                expect(text(for: 1)).to(equal("1 byte"))
            }
            
            it("uses bytes up to 0.5 kB") {
                expect(text(for: 2)).to(equal("2 bytes"))
                expect(text(for: 511)).to(equal("511 bytes"))
            }
            
            it("uses kB up to 0.5 MB") {
                let base: UInt64 = 1
                expect(text(for: base * 512)).to(equal("0.50 kB"))
                expect(text(for: base * 1000)).to(equal("0.98 kB"))
                expect(text(for: base * 1024)).to(equal("1.00 kB"))
                expect(text(for: base * 1024 * 511)).to(equal("511.00 kB"))
            }
            
            it("uses MB up to 0.5 GB") {
                let base: UInt64 = 1024
                expect(text(for: base * 512)).to(equal("0.50 MB"))
                expect(text(for: base * 1000)).to(equal("0.98 MB"))
                expect(text(for: base * 1024)).to(equal("1.00 MB"))
                expect(text(for: base * 1024 * 511)).to(equal("511.00 MB"))
            }
            
            it("uses GB up to 0.5 TB") {
                let base: UInt64 = 1024 * 1024
                expect(text(for: base * 512)).to(equal("0.50 GB"))
                expect(text(for: base * 1000)).to(equal("0.98 GB"))
                expect(text(for: base * 1024)).to(equal("1.00 GB"))
                expect(text(for: base * 1024 * 511)).to(equal("511.00 GB"))
            }
            
            it("uses TB up to 0.5 PB") {
                let base: UInt64 = 1024 * 1024 * 1024
                expect(text(for: base * 512)).to(equal("0.50 TB"))
                expect(text(for: base * 1000)).to(equal("0.98 TB"))
                expect(text(for: base * 1024)).to(equal("1.00 TB"))
                expect(text(for: base * 1024 * 511)).to(equal("511.00 TB"))
            }
            
            it("uses PB for all sizes greater than 0.5 PB") {
                let base: UInt64 = 1024 * 1024 * 1024 * 1024
                expect(text(for: base * 512)).to(equal("0.50 PB"))
                expect(text(for: base * 1000)).to(equal("0.98 PB"))
                expect(text(for: base * 1024)).to(equal("1.00 PB"))
                expect(text(for: base * 1024 * 512)).to(equal("512.00 PB"))
            }
        }
    }
}
