//
//  ViewController.swift
//  iExtraExample
//
//  Created by Saidi Daniel (BookBeat) on 2017-12-05.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import iExtra

class ViewController: UIViewController {

    var i = 0
    
    let feedback: [HapticFeedback] = [
        .error,
        .success,
        .warning,
        
        .lightImpact,
        .mediumImpact,
        .heavyImpact,
        
        .selectionChanged
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIDevice.current.modelType)
        
        let button = UIButton(type: .contactAdd)
        button.frame = CGRect(x: 100, y: 100, width: 300, height: 100)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        if i == self.feedback.count { i = 0 }
        let feedback = self.feedback[i]
        print(feedback.identifier)
        feedback.trigger()
        i += 1
    }
}

