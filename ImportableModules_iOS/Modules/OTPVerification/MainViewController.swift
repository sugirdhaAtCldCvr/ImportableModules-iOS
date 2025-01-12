//
//  ViewController.swift
//  OTPVerification
//
//  Created by Sugirdha Vaithyanathan on 25/10/23.
//

import UIKit

class MainViewController: BaseViewController {

    let emailTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @objc func nextButtonTapped() {
        let nextVc = OTPViewController()
        nextVc.emailString = emailTextField.text ?? "example@abc.com"
        navigationController?.pushViewController(nextVc, animated: true)
    }

}

// MARK: - Setup and Layout
extension MainViewController {
    
    private func setup() {
        /// style
        titleLabel.text = "Enter your email address"
        descriptionLabel.text = "We'll send you an OTP code for verifiction"
        
        emailTextField.placeholder = "Enter your email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        
        /// functionality
        emailTextField.delegate = self
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .primaryActionTriggered)
        
        /// layout
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emailTextField)
        stackView.spacing = 60
        stackView.setCustomSpacing(10, after: titleLabel)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: emailTextField.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
        ])
    }
    
}

// MARK: - TextField Delegate
extension MainViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text != nil {
            nextButton.isEnabled = textField.didEnterValidEmail()
        }

    }
    
}
