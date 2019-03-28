//
//  MockOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import iExtra

class MockOperationCoordinator: OperationCoordinator {
    
    var performErrors = [Error]()
    var shouldPerformCompletion = true
    
    var performInvokeCount = 0
    var performInvokeOperations = [[Operation]]()
    var performInvokeCompletions = [OperationCoordinatorCompletion]()
    func perform(_ operations: [Operation], completion: @escaping OperationCoordinatorCompletion) {
        performInvokeCount += 1
        performInvokeOperations.append(operations)
        performInvokeCompletions.append(completion)
        if !shouldPerformCompletion { return }
        performRegisteredCompletions()
    }
    
    func performRegisteredCompletions() {
        performInvokeCompletions.forEach { $0(performErrors) }
    }
}
