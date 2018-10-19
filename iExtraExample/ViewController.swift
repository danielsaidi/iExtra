//
//  ViewController.swift
//  iExtraExample
//
//  Created by Saidi Daniel (BookBeat) on 2017-12-05.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import iExtra

class Shadow: ShadowStyle {
 
    var alpha: Float { return 1 }
    var blur: CGFloat { return 0.5 }
    var color: UIColor { return .purple }
    var spread: CGFloat { return 1 }
    var x: CGFloat { return 0 }
    var y: CGFloat { return 2 }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = PannableView(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        view.applyCornerRadius(CornerRadius(radius: 20))
        view.backgroundColor = .red
        self.view.addSubview(view)
    }
}
