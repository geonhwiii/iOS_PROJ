//
//  SecondViewController.swift
//  13_DatePicker
//
//  Created by 정건휘 on 01/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit
import AudioToolbox

class SecondViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var picker: UIDatePicker!
    
    var remainingSeconds = 0
    
    @IBAction func start(_ sender: Any) {
        timeLabel.text = "\(Int(picker.countDownDuration))"
        remainingSeconds = Int(picker.countDownDuration)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.remainingSeconds -= 1
            self.timeLabel.text = "\(self.remainingSeconds)"
            
            if self.remainingSeconds == 0 {
                timer.invalidate()
                AudioServicesPlaySystemSound(1315)
            }
        }
        
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.countDownDuration = 60
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
