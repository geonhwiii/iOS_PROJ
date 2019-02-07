//
//  ViewController.swift
//  08_Switch
//
//  Created by 정건휘 on 31/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    @IBAction func stateChanged(_ sender: UISwitch) {
        imageView.isHighlighted = sender.isOn
    }
    @IBAction func toggleButton(_ sender: Any) {
        toggleSwitch.setOn(!toggleSwitch.isOn, animated: true)
        stateChanged(toggleSwitch)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleSwitch.isOn = imageView.isHighlighted
    }


}

