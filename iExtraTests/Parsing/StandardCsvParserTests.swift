//
//  StandardCsvParserTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class StandardCsvParserTests: QuickSpec {
    
    override func spec() {
        
        var parser: CsvParser!
        
        beforeEach {
            parser = StandardCsvParser()
        }
        
        describe("parsing strings") {
            
            it("can parse semicolon-separated string") {
                let result = parser.parseCvsString("foo;bar;baz\nenough", separator: ";")
                expect(result.count).to(equal(2))
                expect(result[0]).to(equal(["foo", "bar", "baz"]))
                expect(result[1]).to(equal(["enough"]))
            }
            
            it("can parse comma-separated string") {
                let result = parser.parseCvsString("a,b,c", separator: ",")
                expect(result.count).to(equal(1))
                expect(result[0]).to(equal(["a", "b", "c"]))
            }
        }
        
        describe("parsing files") {
            
            it("can parse semicolon-separated file") {
                let bundle = Bundle(for: StandardCsvParserTests.self)
                let parseResult = try? parser.parseCvsFile(named: "TestFile_semicolons", withExtension: "csv", in: bundle, separator: ";")
                let result = parseResult!
                expect(result.count).to(equal(3))
                expect(result[0]).to(equal(["a", "b", "c"]))
                expect(result[1]).to(equal(["d", "e", "f"]))
                expect(result[2]).to(equal(["g", "h"]))
            }
            
            it("can parse hash-separated file") {
                let bundle = Bundle(for: StandardCsvParserTests.self)
                let parseResult = try? parser.parseCvsFile(named: "TestFile_hashes", withExtension: "hsv", in: bundle, separator: "#")
                let result = parseResult!
                expect(result.count).to(equal(3))
                expect(result[0]).to(equal(["a", "b", "c"]))
                expect(result[1]).to(equal(["d", "e", "f"]))
                expect(result[2]).to(equal(["g", "h"]))
            }
        }
    }
}
