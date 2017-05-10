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
        let url = Bundle.main.url(forResource: "example", withExtension: "mp3")!
        ap = try! AVAudioPlayer(contentsOf: url)
        ap.play()
        ap.volume = 0
    }
    
    var ap: AVAudioPlayer!

    @IBAction func fadeOut(_ sender: Any) {
        print(Date())
        ap.fadeVolume(to: 1, duration: 2) {
            print(Date())
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

