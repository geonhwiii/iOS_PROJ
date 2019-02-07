//
//  ViewController.swift
//  15_SliderWithColor
//
//  Created by 정건휘 on 07/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBAction func colorChanged(_ sender: UISlider) {
        let r = CGFloat(sliderRed.value)
        let g = CGFloat(sliderGreen.value)
        let b = CGFloat(sliderBlue.value)
        
        colorView.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        colorView.backgroundColor = UIColor(displayP3Red: 19.0/255.0, green: 30.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
        
        colorView.backgroundColor?.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        sliderRed.value = Float(r)
        sliderGreen.value = Float(g)
        sliderBlue.value = Float(b)
        
        
        
        
    }


}

