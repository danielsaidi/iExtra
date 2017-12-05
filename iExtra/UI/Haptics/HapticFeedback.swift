//
//  HapticFeedback.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-05.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public enum HapticFeedback: String {
    
    case
    error,
    success,
    warning,
    
    lightImpact,
    mediumImpact,
    heavyImpact,
    
    selectionChanged
    
    
    // MARK: - Properties
    
    public var identifier: String {
        return rawValue
    }
}


// MARK: - Public Functions

public extension HapticFeedback {
    
    public func trigger() {
        switch self {
        case .error: trigger(feedbackType: .error)
        case .success: trigger(feedbackType: .success)
        case .warning: trigger(feedbackType: .warning)
        
        case .lightImpact: trigger(impactStyle: .light)
        case .mediumImpact: trigger(impactStyle: .medium)
        case .heavyImpact: trigger(impactStyle: .heavy)
            
        case .selectionChanged: triggerSelectionChanged()
        }
    }
}


// MARK: - Private Functions

fileprivate extension HapticFeedback {
    
    func trigger(feedbackType: UINotificationFeedbackType) {
        if #available(iOS 10.0, *) {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(feedbackType)
        }
    }
    
    func trigger(impactStyle: UIImpactFeedbackStyle) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: impactStyle)
            generator.impactOccurred()
        }
    }
    
    func triggerSelectionChanged() {
        if #available(iOS 10.0, *) {
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        }
    }
}
