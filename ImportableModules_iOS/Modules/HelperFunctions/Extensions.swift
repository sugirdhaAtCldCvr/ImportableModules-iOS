//
//  Extensions.swift
//  HelperFunctions
//
//  Created by Sugirdha Vaithyanathan on 1/10/23.
//

import Foundation

extension String {
    func presentDescription(_ str: String) -> String {
        return self + ": " + str
    }
    
    func appendIdEmailExtn() -> String {
        return self + "@" + AllowedEmailDomains.firstDomain.rawValue
    }
    
    func appendEmailExtn() -> String {
        return self + "@" + AllowedEmailDomains.secondDomain.rawValue
    }
    
    func getIdComponent() -> String {
        return self.components(separatedBy: "@").first ?? ""
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let isValidEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: self)
        return isValidEmail
    }
    
    func hasNumber() -> Bool {
        let regEx = ".*[0-9].*"
        let result = NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: self)
        return result
    }
    
    func hasBothCases() -> Bool {
        let regEx = "(.*[A-Z].*[a-z].*)|(.*[a-z].*[A-Z].*)"
        let result = NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: self)
        return result
    }
    
    func hasSymbol() -> Bool {
        let regEx = ".*[!@#$%^&*()_+=].*"
        let result = NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: self)
        return result
    }
}
