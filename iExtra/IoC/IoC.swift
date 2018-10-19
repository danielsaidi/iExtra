//
//  IoC.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-10.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This class can be used to remove coupling to your preferred
 IoC library, e.g. Dip or Swinject. Just add a `IocContainer`
 protocol implementation that wraps this library to your app,
 then register it with this class. You can then use the `IoC`
 class instead of referring to the IoC library.
 
 In this folder, you'll find two disabled implementations of
 `IocContainer`; one for `Dip` and one for `Swinject`. These
 can just be copied into your app and uncommented.
 
 */

import Foundation

public final class IoC {
    
    public private(set) static var container: IoCContainer!
    
    public static func register(_ container: IoCContainer) {
        IoC.container = container
    }
    
    public static func resolve<T>() -> T {
        return container.resolve()
    }
    
    public static func resolve<T, A>(arguments arg1: A) -> T {
        return container.resolve(arguments: arg1)
    }
    
    public static func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T {
        return container.resolve(arguments: arg1, arg2)
    }
    
    public static func resolve<T, A, B, C>(arguments arg1: A, _ arg2: B, _ arg3: C) -> T {
        return container.resolve(arguments: arg1, arg2, arg3)
    }
    
    public static func resolve<T, A, B, C, D>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D) -> T {
        return container.resolve(arguments: arg1, arg2, arg3, arg4)
    }
    
    public static func resolve<T, A, B, C, D, E>(arguments arg1: A, _ arg2: B, _ arg3: C, _ arg4: D, _ arg5: E) -> T {
        return container.resolve(arguments: arg1, arg2, arg3, arg4, arg5)
    }
}
