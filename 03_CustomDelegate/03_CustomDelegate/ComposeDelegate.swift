//
//  ComposeDelegate.swift
//  03_CustomDelegate
//
//  Created by 정건휘 on 29/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

protocol ComposeDelegate {
    func composer(_ vc: UIViewController, didInputNewValue value: String?)
    func composerDidCancel(_ vc: UIViewController)
}
