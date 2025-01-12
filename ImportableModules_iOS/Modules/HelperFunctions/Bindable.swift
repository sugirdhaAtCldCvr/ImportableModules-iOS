//
//  Bindable.swift
//  HelperFunctions
//
//  Created by Sugirdha Vaithyanathan on 9/10/23.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }

    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}


// another implementation example
class Observer: NSObject {
    @objc dynamic var message: String = ""
}

class MessageObserver {
    var observation: NSKeyValueObservation?
    
    init(observer: Observer) {
        observation = observer.observe(\.message, options: [.new], changeHandler: { (object, change) in
            if let newValue = change.newValue {
                print("Message received: \(newValue)")
            }
        })
    }
}


//let observer = Observer()
//let messageObserver = MessageObserver(observer: observer)
//
//observer.message = "Hello Observer Pattern"
