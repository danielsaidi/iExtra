//
//  AnimatedLabel.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-03-30.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class AnimatedLabel: UILabel {
    
    
    // MARK: - Initialization
    
    deinit {
        stopAnimating(with: "")
    }
    
    
    // MARK: - Properties
    
    fileprivate var texts: [String]?
    
    fileprivate var timer: Timer?
    
    
    // MARK: - Functions
    
    public func startAnimating(texts: [String], withInterval interval: Double) {
        self.texts = texts
        stopAnimating(with: texts.first)
        guard texts.count > 1 else { return }
        let action = #selector(timerTick)
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: action, userInfo: nil, repeats: true)
    }
    
    public func startLoadingAnimation(withText text: String, interval: Double) {
        let texts = [text, "\(text).", "\(text)..", "\(text)..."]
        startAnimating(texts: texts, withInterval: interval)
    }
    
    public func stopAnimating() {
        timer?.invalidate()
    }
    
    public func stopAnimating(with text: String?) {
        self.text = text
        timer?.invalidate()
    }
}


// MARK: - Internal Functions

extension AnimatedLabel {
    
    func timerTick() {
        let text = texts?.first ?? ""
        self.text = text
        texts?.removeFirst()
        texts?.insert(text, at: texts?.count ?? 0)
    }
}
