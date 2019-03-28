//
//  OperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 An operation coordinator can be used to coordinate how many
 operations are performed.
 
 */

import Foundation

public protocol OperationCoordinator {
    
    typealias OperationCoordinatorCompletion = ([Error]) -> ()
    
    func perform(_ operations: [Operation], completion: @escaping OperationCoordinatorCompletion)
}
