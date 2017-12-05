//
//  IoCTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-17.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra


class TestContainer: NSObject, IoCContainer {
    
    func resolve<T>() -> T {
        return "foo" as! T
    }
    
    func resolve<T, A>(arguments arg1: A) -> T  {
        return "foo" as! T
    }
    
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        return "foo" as! T
    }
}


class IoCTests: QuickSpec {
    
    override func spec() {
        
        describe("registering container") {
        
            it("registers shared container") {
                IoC.register(TestContainer())
            }
        }
        
        describe("resolving dependencies") {
            
            it("uses shared container") {
                let message: String = IoC.resolve()
                expect(message).to(equal("foo"))
            }
        }
    }
}
