//
//  IoCTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra


class TestContainer: NSObject, IoCContainer {
    
    func resolve<T>() -> T {
        guard let result = "foo" as? T else { fatalError() }
        return result
    }
    
    func resolve<T, A>(arguments arg1: A) -> T {
        guard let result = "foo" as? T else { fatalError() }
        return result
    }
    
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        guard let result = "foo" as? T else { fatalError() }
        return result
    }
    
    func resolve<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T {
        guard let result = "foo" as? T else { fatalError() }
        return result
    }
    
    func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T {
        guard let result = "foo" as? T else { fatalError() }
        return result
    }
    
    func resolve<T, A, B, C, D, E>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D, _ arg5: E) -> T {
        guard let result = "foo" as? T else { fatalError() }
        return result
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
