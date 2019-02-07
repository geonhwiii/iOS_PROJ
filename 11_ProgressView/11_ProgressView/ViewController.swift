//
//  ViewController.swift
//  11_ProgressView
//
//  Created by 정건휘 on 31/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    
    @IBAction func touchUpButton(_ sender: UIButton) {
        
        progress.setProgress(0.8, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress.progress = 0.0
        
    }


}

