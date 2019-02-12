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
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    // notification 속성을 저장할 토큰
    var tokens = [NSObjectProtocol]()
    // 씬이 완전히 제거되는 시점에 옵저버를 함께 제거
    deinit {
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tokens.forEach { NotificationCenter.default.removeObserver($0) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var token = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            // 키보드 높이만큼 컨텐트 뷰 아래 여백 추가
            if let frameValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardFrame = frameValue.cgRectValue
                // 상수에 저장된 값을 바텀 여백으로 지정
                self?.bottomConstraint.constant = keyboardFrame.size.height
                
                UIView.animate(withDuration: 0.3, animations: {
                    self?.view.layoutIfNeeded()
                }, completion: { finished in
                    UIView.setAnimationsEnabled(true) // 화면이 생성되고 바로 키보드 활성화
                })
            }
            
        }
        tokens.append(token)
        // 키보드가 사라질 때 여백 제거
        token = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            self?.bottomConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self?.view.layoutIfNeeded()
            })
        })
        tokens.append(token)
        
        urlField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EmailViewController {
            vc.bottomMargin = bottomConstraint.constant
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 화면 처음에는 버튼 비활성화
        nextButton.isEnabled = false
        
        
       
    }
    var presented = false
}

extension ViewController: UITextFieldDelegate {
    // 리턴키를 탭할 때마다 호출됨.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 리턴키를 누르면 다음화면으로 이동
        let cnt = textField.text?.count ?? 0
        if cnt > 0 {
            performSegue(withIdentifier: "emailSegue", sender: nil)
        }
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !presented {
            // 키보드가 표시되기 전에 애니메이션 비활성화
            UIView.setAnimationsEnabled(false)
            presented = true
        }
        
    }
    
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
        
        nextButton.isEnabled = finalText.length > 0
 
        
        return true // true -> 키보드에서 입력한 문자가 실제로 텍스트 필드에 입력됨
    }
}

