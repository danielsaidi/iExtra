//
//  SerialOperationCoordinatorTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class SerialOperationCoordinatorTests: QuickSpec {
    
    override func spec() {
        
        var coordinator: SerialOperationCoordinator!
        var counter: TestCounter!
        
        beforeEach {
            coordinator = SerialOperationCoordinator()
            counter = TestCounter()
        }
        
        it("completes once for empty sequence") {
            var count = 0
            coordinator.perform([]) { _ in count += 1 }
            expect(count).to(equal(1))
        }
        
        it("completes once for non-empty sequence") {
            var count = 0
            let operation1 = TestOperation(counter: counter, performCompletion: true)
            let operation2 = TestOperation(counter: counter, performCompletion: true)
            let operations = [operation1, operation2]
            coordinator.perform(operations) { _ in count += 1 }
            expect(count).to(equal(1))
        }
        
        it("performs operation on each item") {
            let operation1 = TestOperation(counter: counter, performCompletion: true)
            let operation2 = TestOperation(counter: counter, performCompletion: true)
            let operations = [operation1, operation2]
            coordinator.perform(operations) { _ in }
            expect(counter.count).to(equal(2))
        }
        
        it("performs operation until one operation does not complete") {
            let operation1 = TestOperation(counter: counter, performCompletion: false)
            let operation2 = TestOperation(counter: counter, performCompletion: true)
            let operations = [operation1, operation2]
            coordinator.perform(operations) { _ in }
            expect(counter.count).to(equal(1))
        }
        
        it("does not complete if one operation does not complete") {
            var count = 0
            let operation1 = TestOperation(counter: counter, performCompletion: true)
            let operation2 = TestOperation(counter: counter, performCompletion: false)
            let operations = [operation1, operation2]
            coordinator.perform(operations) { _ in count += 1 }
            expect(count).to(equal(0))
        }
        
        it("completes with returned errors") {
            let error = NSError(domain: "foo", code: 1, userInfo: nil )
            let operation1 = TestOperation(counter: counter, performCompletion: true)
            let operation2 = TestOperation(counter: counter, performCompletion: true)
            let operations = [operation1, operation2]
            operation2.error = error
            var errors = [Error?]()
            coordinator.perform(operations) { res in errors = res }
            expect(errors.count).to(equal(1))
            expect(errors[0]).to(be(error))
        }
    }
}


private class TestCounter {
    
    var count: Int = 0
}

private class TestOperation: iExtra.Operation {
    
    init(counter: TestCounter, performCompletion: Bool) {
        self.counter = counter
        self.performCompletion = performCompletion
    }
    
    var error: Error?
    private var counter: TestCounter
    private var performCompletion: Bool
    
    func perform(completion: @escaping OperationCompletion) {
        counter.count += 1
        guard performCompletion else { return }
        completion(error)
    }
}
