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
        let image = UIImage(named: "cover")
        let view = UIImageView(image: image)
        self.view.addSubview(view)
    }
}
