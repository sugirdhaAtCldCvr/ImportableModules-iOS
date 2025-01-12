//
//  Utils.swift
//  OTPVerification
//
//  Created by Sugirdha Vaithyanathan on 26/10/23.
//

import UIKit

func isValidEmail(_ str: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return predicate.evaluate(with: str)
}

extension UITextField {
    func didEnterValidEmail() -> Bool {
        guard let text = self.text else { return false }
        return !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && isValidEmail(text)
    }
}
