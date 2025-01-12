//
//  Logger.swift
//  HelperFunctions
//
//  Created by Sugirdha Vaithyanathan on 1/10/23.
//

import Foundation

public class Logger {
    
    public class func debug(message:String) {
        #if DEBUG
            print("\(message)")
        #endif
    }
    
    public class func debugWithData(message:String, content:Any) {
        #if DEBUG
            print("\(message) ", content)
        #endif
    }
}
