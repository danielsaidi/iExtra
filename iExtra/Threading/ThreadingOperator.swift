//
//  ThreadingOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-20.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

/*
 
 The ~> operator makes it easy to run blocks on a background
 thread then run a callback block on the main thread as soon
 as the background block completes.
 
 You can either call blocks with no return values which then
 trigger a parameterless callback block, or call blocks with
 a return value which then triggers the callback block using
 the return value as an input parameter, as such:

 ```swift
{ println("hello,") } ~> { println(" world") }
{ "hello," } ~> { println("\($0) world") }
 ```

 Read more here:
 http://ijoshsmith.com/2014/07/05/custom-threading-operator-in-swift/

 Note that the line before a {} ~> {} as well a the {} ~> {}
 line itself must use SEMICOLONS to prevent compile errors.
 
*/

import Foundation

infix operator ~>


/**
Executes the lefthand closure on a background thread and,
upon completion, the righthand closure on the main thread.
*/

public func ~> (block: @escaping () -> (), callback: @escaping () -> ()) {
    queue.async {
        block()
        DispatchQueue.main.async { callback() }
    }
}


/**
Executes the lefthand closure on a background thread and,
upon completion, the righthand closure on the main thread.
Passes the background closure's output to the main closure.
*/

public func ~> <T> (block: @escaping () -> T, callback: @escaping (_ result: T) -> ()) {
    queue.async {
        let result = block()
        DispatchQueue.main.async { callback(result) }
    }
}


/** Serial dispatch queue used by the ~> operator. */

private let queue = DispatchQueue(label: "serial-worker", attributes: [])
