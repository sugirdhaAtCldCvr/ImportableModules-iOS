//
//  OTPInputView.swift
//  OTPVerification
//
//  Created by Sugirdha Vaithyanathan on 26/10/23.
//

import UIKit

protocol OTPInputDelegate: AnyObject {
    func isValidInput(_ isValid: Bool, input: Int?)
}

//extension OTPInputDelegate {
//    func isValidInput(_ isValid: Bool, input: Int? = nil) {
//        return isValidInput(isValid, input: input)
//    }
//}

class OTPInputView: UIView {

    private let stackView = UIStackView()
    private var textFields: [OTPTextField] = []
    
    var otpInputDelegate: OTPInputDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: - Setup and Layout
extension OTPInputView {
    
    private func setup() {
        for index in 0..<Constants.otpDigitsNum {
            let textView = OTPTextView()
            
            let field = textView.textField
            textFields.append(field)
            
            if index == 0 {
                field.prevTF = nil
            } else {
                field.prevTF = textFields[index - 1]
                textFields[index - 1].nextTF = field
            }
            
            stackView.addArrangedSubview(textView)
        }
        
        /// style
        stackView.isUserInteractionEnabled = true
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        /// layout
        heightAnchor.constraint(equalToConstant: 60).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10),
        ])
    }
    
}
