//
//  Configurations.swift
//  CDP
//
//  Created by Praveen Jangre on 09/06/2025.
//

import Foundation


//Finish
public protocol Finish: CustomStringConvertible {
    var color: String {get}
    var price: Int {get}
}

extension Finish {
    public var description: String {
        return "\(color)"
    }
}


public struct Silver: Finish {
    public let color = "silver"
    public let price = 200
    public init() {}
}

public struct SpaceGray: Finish {
    public let color = "space gray"
    public let price: Int = 215
    public init() {}
}


// Processor
public protocol Processor: CustomStringConvertible {
    var type: String {get}
    var price: Int {get}
}

extension Processor {
    public var description: String {
        return "\(type)"
    }
}

public struct Fast: Processor {
    public let type: String = "fast"
    public let price: Int = 300
    public init() {}
}

public struct Turbo: Processor {
    public let type: String = "turbo"
    public let price: Int = 500
    public init() {}
}


//Graphics
public protocol Graphics: CustomStringConvertible {
    var card: String {get}
    var price: Int {get}
}

extension Graphics {
    public var description: String {
        return "\(card)"
    }
}

public struct Standard: Graphics {
    public let card: String = "standard"
    public let price: Int = 400
    public init() {}

}


public struct Ultra: Graphics {
    public let card: String = "ultra"
    public let price: Int = 600
    
    public init() {}
}
