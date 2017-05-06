//
//  IoC.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-10.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public final class IoC {
    
    private static var _container: IoCContainer!
    
    public static var container: IoCContainer {
        return _container
    }
    
    public static func register(_ container: IoCContainer) {
        _container = container
    }
    
    public static func resolve<T>() -> T {
        return _container.resolve()
    }
    
    public static func resolve<T, A>(arguments arg1: A) -> T {
        return _container.resolve(arguments: arg1)
    }
    
    public static func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        return _container.resolve(arguments: arg1, arg2)
    }
}
