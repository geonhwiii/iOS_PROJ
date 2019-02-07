//
//  ComposeViewController.swift
//  03_CustomDelegate
//
//  Created by 정건휘 on 29/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var delegate: ComposeDelegate?
    
    @IBOutlet weak var inputField: UITextField!
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
        delegate?.composerDidCancel(self)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.composer(self, didInputNewValue: inputField.text)
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
