//
//  ViewController.swift
//  21_SlackLogin
//
//  Created by 정건휘 on 12/02/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let charSet: CharacterSet = {
        var cs = CharacterSet.lowercaseLetters
        cs.insert(charactersIn: "0123456789")
        cs.insert(charactersIn: "-")
        return cs.inverted
    }()
    // 허용되어 있지 않은 문자를 검색하는게 훨씬 빠르므로 invert함.
    
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var placeholderLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 문자가 있다면, 즉 입력모드
        if string.count > 0 {
            // rangeOfCharacter(from:) : 검색되었다면 해당 범위 리턴, 아니면 nil을 리턴
            // nil이 아닌 경우 false를 리턴하면 허용된 문자만 입력된다.
            guard string.rangeOfCharacter(from: charSet) == nil else {
                return false
            }
        }
        
        // 문자열을 편집하기 위해 가변클래스인 NSMutableString클래스를 사용한다.
        // textField의 문자열로 초기화
        let finalText = NSMutableString(string: textField.text ?? "")
        // 입력이나 삭제가 반영된 최종 문자열이 구성된다.
        finalText.replaceCharacters(in: range, with: string)
        
        // 입력된 텍스트 넓이 계산
        let font = textField.font ?? UIFont.systemFont(ofSize: 16)
        // font로 문자열 딕셔너리를 생성
        let dict = [NSAttributedString.Key.font: font]
        // size로 크기를 얻은 뒤 넓이만 상수로 저장
        let width = finalText.size(withAttributes: dict).width
        // 계산된 넓이로 왼쪽 여벡 업데이트
        placeholderLeadingConstraint.constant = width
        
        if finalText.length == 0 {
            placeholderLabel.text = "workspace-url.slack.com"
        } else {
            placeholderLabel.text = ".slack.com"
        }
 
        
        return true // true -> 키보드에서 입력한 문자가 실제로 텍스트 필드에 입력됨
    }
}

