//
//  OTPTextField.swift
//  OTPVerification
//
//  Created by Sugirdha Vaithyanathan on 1/11/23.
//

import UIKit

class OTPTextField: UITextField {

    weak var prevTF: OTPTextField?
    weak var nextTF: OTPTextField?
    
    override public func deleteBackward() {
        print("deleting backward")
        if let hasText = prevTF?.hasText, hasText {
            prevTF?.text = ""
        }
        prevTF?.becomeFirstResponder()
    }

}
