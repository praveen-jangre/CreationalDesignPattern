//
//  Builder.swift
//  CDP
//
//  Created by Praveen Jangre on 08/06/2025.
//

import Foundation

public protocol LaptopBuilder {
    var size: Size {get set}
    var chip: Chip {get set}
    var memory: Memory {get set}
    
    mutating func buildParts(configuration: [String : String])
    func getLaptop() -> Laptop
}


extension LaptopBuilder {
    mutating public func buildParts(configuration: [String : String]) {
        if let upgradedSize = configuration["size"] {
            switch upgradedSize {
            case "14-inch":
                size = .fourteenInch
            case "16-inch":
                size = .sixteenInch
            default:
                print("Invalid size value")
            }
        }
        
        if let upgradedChip = configuration["chip"] {
            switch upgradedChip {
            case "M3":
                chip = .m3
            case "M3 Pro":
                chip = .m3pro
            case "M3 Max":
                chip = .m3max
            default:
                print("Invalid chip value")
            }
        }
        
        if let upgradedMemory = configuration["memory"] {
            switch upgradedMemory {
            case "8GB":
                memory = .eightGB
            case "16GB":
                memory = .sixteenGB
            case "36GB":
                memory = .thirtySixGB
            default:
                print("Invalid memory")
            }
        }
    }
    
    
    public func getLaptop() -> Laptop {
        Laptop(size: size, chip: chip, memory: memory)
    }
}


//Builder classes
public class StarterLaptopBuilder: LaptopBuilder {
    public var size: Size = Size.fourteenInch
    public var chip: Chip = Chip.m3
    public var memory: Memory = Memory.eightGB
    
    public init() {
    }
}

public class AdvancedLaptopBuilder: LaptopBuilder {
    public var size: Size = Size.fourteenInch
    public var chip: Chip = Chip.m3pro
    public var memory: Memory = Memory.sixteenGB
    
    public init() {
    }
}

public class HighEndLaptopBuilder: LaptopBuilder {
    public var size: Size = Size.sixteenInch
    public var chip: Chip = Chip.m3max
    public var memory: Memory = Memory.thirtySixGB
    
    public init() {
    }
}



// Director

public class Director {
    private var builder: LaptopBuilder?
    
    public init(builder: LaptopBuilder? = nil) {
        self.builder = builder
    }
    
    public func constructLaptop (configuration: [String : String]) {
        builder?.buildParts(configuration: configuration)
    }
}


