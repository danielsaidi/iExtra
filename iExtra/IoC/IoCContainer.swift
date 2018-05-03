//
//  IoCContainer.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-10.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol provides as many arguments as `SwiftLint` has
 as default `function_parameter_count` warning limit.
 
 */

import Foundation

public protocol IoCContainer {
    
    func resolve<T>() -> T
    func resolve<T, A>(arguments arg1: A) -> T
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T
    func resolve<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T
    func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T
    func resolve<T, A, B, C, D, E>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D, _ arg5: E) -> T
}
