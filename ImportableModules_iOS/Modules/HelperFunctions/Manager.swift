//
//  Manager.swift
//  HelperFunctions
//
//  Created by Sugirdha Vaithyanathan on 1/10/23.
//

import Foundation

enum AllowedEmailDomains: String, CaseIterable {
    case firstDomain = "abc.com"
    case secondDomain = "efg.sg"
    case thirdDomain = "hij.org"
}

enum PasswordHintRules {
    case containsMinChars
    case containsCases
    case containsNumberSymbol
}

class Manager {
    
    /// Email Validation
    public static func validateEmail(_ emailString: String) -> Bool {
        guard emailString.isValidEmail() else { return false }
        
        let domainName = emailString.lowercased().components(separatedBy: "@")[1]
        let isValidDomain = AllowedEmailDomains.allCases.contains { $0.rawValue == domainName }
        return isValidDomain
    }
    
    public static func validatePassword(_ passwordString: String) -> [PasswordHintRules: Bool] {
        var rules = [PasswordHintRules: Bool]()
        let hasMinChars = passwordString.count >= 8
        let hasNumber = passwordString.hasNumber()
        let hasBothCases = passwordString.hasBothCases()
        let hasSymbol = passwordString.hasSymbol()
        
        rules[.containsMinChars] = hasMinChars
        rules[.containsCases] = hasBothCases
        rules[.containsNumberSymbol] = hasSymbol || hasNumber
        
        return rules
    }
    
    public static func getUserId(_ emailString: String) -> (String?, String?) {
        guard validateEmail(emailString) else { return (nil, nil) }
        
        let userName = emailString.components(separatedBy: "@")[0]
        let userId = userName.appendIdEmailExtn()
        return (userName, userId)
    }
    
    public static func getNameComponents(_ nameString: String) -> (String, String) {
        let names = nameString.components(separatedBy: " ")
        let first = names.first ?? ""
        let second = names.count > 1 ? names[1...names.count-1].joined(separator: " ") : ""
        let (firstName, lastName) = (first, second)
        
        return (firstName, lastName)
    }
    
    public static func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    public static func readLocalFile(forFile fileName: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json") {
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
                return jsonData
            }
        } catch {
            Logger.debug(message: error.localizedDescription)
        }
        return nil
    }

}
