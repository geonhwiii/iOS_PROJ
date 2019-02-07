//
//  ViewController.swift
//  13_DatePicker
//
//  Created by 정건휘 on 01/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picker: UIDatePicker!
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print(sender.date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.datePickerMode = .dateAndTime
        picker.locale = Locale(identifier: "ko_KR")
        picker.minuteInterval = 1
        
        picker.date = Date()
        picker.setDate(Date(), animated: true)
        
        //        picker.minimumDate
        //        picker.maximumDate
        
        //        picker.countDownDuration = 60
        
        //        picker.calenda
        //        picker.timeZone
    }
    
    
}

