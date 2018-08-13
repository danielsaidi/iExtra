//
//  HintManager.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-08.
//  Copyright © 2016 iExtra. All rights reserved.
//

import Foundation

public protocol HintManagerDelegate: class {
    func hintManagerDidTriggerBehaviorHint(_ manager: HintManager)
    func hintManagerDidTriggerInactivityHint(_ manager: HintManager)
}


public protocol HintManager {
    var delegate: HintManagerDelegate? { get set }
    
    func disable()
    func enable()
    func showBehaviorHint()
    func showInactivityHint()
    func trackActivity()
    func trackCorrectBehavior()
    func trackIncorrectBehavior()
}
