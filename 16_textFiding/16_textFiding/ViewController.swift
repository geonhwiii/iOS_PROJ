//
//  ViewController.swift
//  16_textFiding
//
//  Created by 정건휘 on 07/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func find(_ sender: UIButton) {
        guard let word = textField.text else { return }
        
        if let text = textView.text as NSString? {
            let range = text.range(of: word)
            textView.selectedRange = range
            textView.scrollRangeToVisible(range)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        let range = textView.selectedRange
        print(range)
    }
}
