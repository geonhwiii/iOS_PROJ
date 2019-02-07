//
//  ViewController.swift
//  14_ImageList
//
//  Created by 정건휘 on 07/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func start(_ sender: UIButton) {
        imageView.startAnimating()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        if imageView.isAnimating {
            imageView.stopAnimating()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageSet = (0...2).compactMap { UIImage(named: "image\($0)") }
        imageView.animationImages = imageSet
        imageView.animationDuration = 3
        imageView.animationRepeatCount = 10
    }
    
    
}

