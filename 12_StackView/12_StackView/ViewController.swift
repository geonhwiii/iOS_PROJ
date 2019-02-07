//
//  ViewController.swift
//  12_StackView
//
//  Created by 정건휘 on 31/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func toggleButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3) { // .animate가 중요
            if self.stackView.axis == .horizontal {
                self.stackView.axis = .vertical
            } else {
                self.stackView.axis = .horizontal
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

