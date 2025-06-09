//
//  Singleton.swift
//  CDP
//
//  Created by Praveen Jangre on 06/06/2025.
//

// Singleton: Provides a globally accessible, shared instance of a class.
// Example: Shared database controller, Unique network manager

// Common Singleton Pitfalls
//  * Misuse as global container - Violates Single Responsibility Principle
//  * Hidden dependancies - Creates an illusion of low coupling
//  * Thread safety challanges - Thread safety and performance are crucial

import Foundation


final public class AppSetting {
    public static let shared = AppSetting()
    private var settings: [String : Any] = [:]
    //private let serialQueue = DispatchQueue(label: "SerialQueue")
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private init() {
        
    }
    
    public func set(value: Any, forKey key: String) {
        concurrentQueue.async(flags: .barrier) {
            self.settings[key] = value
        }

        
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        concurrentQueue.async {
            result = self.settings[key]
        }
        
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}



func implementSingleton() {
    let count = 100
    for index in 0..<count {
        AppSetting.shared.set(value: index, forKey: String(index))
    }
    
    DispatchQueue.concurrentPerform(iterations: count) { index in
        if let n = AppSetting.shared.object(forKey: String(index)) {
            print("Fetched value is \(n)")
        }
    }
    
    AppSetting.shared.reset()
    
    DispatchQueue.concurrentPerform(iterations: count) { index in
        print("Iteration index = \(index)")
        AppSetting.shared.set(value: index, forKey: String(index))
    }
}
