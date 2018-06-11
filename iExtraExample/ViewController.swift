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
        let image = UIImage(named: "cover")
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        self.view.addSubview(view)
        view.fade(to: 0.5, withDuration: 3) { finished in
            view.fade(to: 0.8, withDuration: 3) { finished in
                view.fade(to: 0, withDuration: 3) { finished in
                    print(view.isHidden)
                }
            }
        }
    }
}
