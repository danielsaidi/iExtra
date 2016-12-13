//
//  LoggingHintManager.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public class LoggingHintManager: HintManagerBase {
    
    
    // MARK: Initialization
    
    public override init() {
        super.init()
    }
    
    
    
    // MARK: Public functions
    
    public override func showBehaviorHint() {
        print("Show behavior hint")
    }
    
    public override func showInactivityHint() {
        print("Show inactivity hint")
    }
}
