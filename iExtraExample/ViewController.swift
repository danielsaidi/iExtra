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
        let view = UIView(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .red
        self.view.addSubview(view)
        view.startRotation(withDuration: 10)
    }
}
