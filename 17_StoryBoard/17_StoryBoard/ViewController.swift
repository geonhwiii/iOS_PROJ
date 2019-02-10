//
//  ViewController.swift
//  17_StoryBoard
//
//  Created by 정건휘 on 08/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func persentModalVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Sub", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "modalVC")
        present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

