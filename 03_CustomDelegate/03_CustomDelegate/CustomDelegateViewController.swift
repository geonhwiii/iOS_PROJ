//
//  CustomDelegateViewController.swift
//  03_CustomDelegate
//
//  Created by 정건휘 on 29/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class CustomDelegateViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @objc func presentComposeSegue() {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentComposeSegue))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController,
            let vc = nav.topViewController as? ComposeViewController {
            vc.delegate = self
        }
    }
}


extension CustomDelegateViewController: ComposeDelegate {
    func composerDidCancel(_ vc: UIViewController) {
        valueLabel.text = "Cancel"
    }
    
    func composer(_ vc: UIViewController, didInputNewValue value: String?) {
        valueLabel.text = value
    }
}
