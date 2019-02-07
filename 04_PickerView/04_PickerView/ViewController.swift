//
//  ViewController.swift
//  04_PickerView
//
//  Created by 정건휘 on 29/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func touchUpButton(_ sender: UIButton) {
        let row = pickerView.selectedRow(inComponent: 0)
        guard row >= 0 else {
            print("Not found...")
            return
        }
        print(list[row])
        
        
    }
    
    let list = ["AderError", "BrownBreath", "Covernat", "LMC", "THISISNEVERTHAT", "Critic"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(list[row])
    }
}
