//
//  ViewController.swift
//  10_ActivityIndicator
//
//  Created by 정건휘 on 31/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBOutlet weak var hiddenSwitch: UISwitch!
    
    @IBAction func toggleHidden(_ sender: UISwitch) {
        loader.hidesWhenStopped = sender.isOn
        
    }
    @IBAction func startButton(_ sender: UIButton) {
        if !loader.isAnimating {
            loader.startAnimating()
        }
    }
    @IBAction func stopButton(_ sender: UIButton) {
        if loader.isAnimating {
            loader.stopAnimating()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenSwitch.isOn = loader.hidesWhenStopped
        loader.startAnimating()
    }
}

