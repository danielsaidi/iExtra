//
//  IoCContainer.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-10.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol IoCContainer {
    
    func resolve<T>() -> T
    func resolve<T, A>(arguments arg1: A) -> T
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T
}
