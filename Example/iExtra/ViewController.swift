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
        urls = [
            UIApplicationOpenSettingsURLString
        ]
    }
    
    var urls: [String]!
    var index = 0
    

    @IBAction func fadeOut(_ sender: Any) {
        let urlObj = URL(string:UIApplicationOpenSettingsURLString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(urlObj)
        } else {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

