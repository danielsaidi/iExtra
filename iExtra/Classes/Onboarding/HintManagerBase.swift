//
//  HintManagerBase.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public class HintManagerBase: NSObject, HintManager {
    
    
    // MARK: Initialization
    
    public override init() {
        super.init()
    }
    
    
    
    // MARK: Properties
    
    weak public var delegate: HintManagerDelegate?
    
    public var inactivitySecondsTrigger = 10 {
        didSet { enable() }
    }
    
    public var incorrectBehaviorCountTrigger = 5
    
    private var incorrectBehaviorCount = 0
    private var timer: Timer!
    
    
    
    // MARK: Public functions
    
    public func disable() {
        timer?.invalidate()
    }
    
    public func enable() {
        disable()
        if inactivitySecondsTrigger > 0 {
            let interval = TimeInterval(inactivitySecondsTrigger)
            let action = #selector(triggerInactivityHint)
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: action, userInfo: nil, repeats: true)
        }
    }
    
    public func showBehaviorHint() {
        // Implement in sub class
    }
    
    public func showInactivityHint() {
        // Implement in sub class
    }
    
    public func trackActivity() {
        enable()
    }
    
    public func trackCorrectBehavior() {
        incorrectBehaviorCount = 0
    }
    
    public func trackIncorrectBehavior() {
        incorrectBehaviorCount += 1
        if incorrectBehaviorCount >= incorrectBehaviorCountTrigger {
            triggerBehaviorHint()
        }
    }
    
    public func triggerBehaviorHint() {
        incorrectBehaviorCount = 0
        showBehaviorHint()
        delegate?.hintManagerDidTriggerBehaviorHint(self)
    }
    
    public func triggerInactivityHint() {
        showInactivityHint()
        delegate?.hintManagerDidTriggerInactivityHint(self)
    }
}
