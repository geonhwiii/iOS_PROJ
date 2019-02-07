//
//  ViewController.swift
//  06_Slider
//
//  Created by 정건휘 on 31/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func sliderChanged(_ sender: Any) {
        let r = CGFloat(redSlider.value)
        let g = CGFloat(greenSlider.value)
        let b = CGFloat(blueSlider.value)
        
        let color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        view.backgroundColor = color
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.setValue(1.0, animated: false)
        greenSlider.value = 1.0
        blueSlider.value = 1.0
        
        
        redSlider.minimumTrackTintColor = UIColor.red
        greenSlider.minimumTrackTintColor = UIColor.green
        blueSlider.minimumTrackTintColor = UIColor.blue
        
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
    }


}

