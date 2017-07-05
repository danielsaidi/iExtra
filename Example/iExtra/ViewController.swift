//
//  ViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 12/03/2016.
//  Copyright (c) 2016 Daniel Saidi. All rights reserved.
//

import UIKit
import AVFoundation
import iExtra

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = PannableView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .red
        view.addSubview(view)
    }
}

