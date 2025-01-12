//
//  OTPTextField.swift
//  OTPVerification
//
//  Created by Sugirdha Vaithyanathan on 26/10/23.
//

import UIKit

class OTPTextView: UIView {
    
    let bottomLine = UIView()
    let textField = OTPTextField()
    
    weak var otpInputDelegate: OTPInputDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear
        
        textField.delegate = self
        textField.becomeFirstResponder()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
        textField.font = UIFont.systemFont(ofSize: 32)
        textField.textColor = .darkText
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .yes
        textField.textContentType = .oneTimeCode
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = .darkText
        bottomLine.autoresizingMask = [.flexibleTopMargin]
        
        [textField, bottomLine].forEach(self.addSubview(_:))
        
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: Constants.bottomLineWidth),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),

            bottomLine.widthAnchor.constraint(equalToConstant: Constants.bottomLineWidth),
            bottomLine.heightAnchor.constraint(equalToConstant: Constants.bottomLineHeight),
            bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
}

// MARK: - UITextFieldDelegate
extension OTPTextView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let otpTextField = textField as? OTPTextField else { return false }
        guard let _ = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) else { return false }
        
        
        print("otp tf ", otpTextField.text, otpTextField.prevTF?.text, otpTextField.nextTF?.text, otpTextField.hasText)
        if (range.length == 0) {
            otpTextField.text = string
            otpTextField.resignFirstResponder()
            otpTextField.nextTF?.becomeFirstResponder()
            
            return false
        }
        return true
    }
    
}
