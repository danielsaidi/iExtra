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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = PannableView(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        view.applyShadow(.strong)
        //view.applyCornerRadius(CornerRadius(radius: 20))
        view.backgroundColor = .red
        self.view.addSubview(view)
    }
}


extension Shadow {
    
    static var strong: Shadow {
        return Shadow(alpha: 1, blur: 0.5, color: .purple, spread: 1, x: 0, y: 2)
    }
}
