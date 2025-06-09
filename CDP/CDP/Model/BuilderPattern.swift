//
//  BuilderPattern.swift
//  CDP
//
//  Created by Praveen Jangre on 08/06/2025.
//

import Foundation

func implementBuilderDesignPattern() {
//    //Testing
//    if let laptop = buildLaptop(configuration: ["base_model" : "starter"]) {
//        print("Configured laptop: \n\(laptop)")
//    }
//    
//    if let laptop = buildLaptop(configuration: ["base_model" : "advanced", "size" : "16-inch"]) {
//        print("Configured laptop: \n\(laptop)")
//    }
//    
//    if let laptop = buildLaptop(configuration: ["base_model" : "pro", "size" : "14-inch", "memory" : "16GB"]) {
//        print("Configured laptop: \n\(laptop)")
//    }
    
    
    //Testing Builder pattern
    var configuration = ["base_model": "advanced", "size" : "16-inch"]
    var laptopBuilder = createBuilder(configuration: configuration)
    
    var director = Director(builder: laptopBuilder)
    
    director.constructLaptop(configuration: configuration)
    
    if let laptop = laptopBuilder?.getLaptop() {
        print(laptop)
    }
    
}

public class Laptop {
    public var size: Size
    public var chip: Chip
    public var memory: Memory
    
    public init(size: Size, chip: Chip, memory: Memory) {
        self.size = size
        self.chip = chip
        self.memory = memory
    }
}


extension Laptop: CustomStringConvertible {
    public var description: String {
        return "\t\(size) MacBook Pro \n \t Chip: \(chip)  \n \t Memory: \(memory)"
    }
}

public enum Size: String, CustomStringConvertible {
    case fourteenInch = "14-inch"
    case sixteenInch = "16-inch"
    
    public var description: String {
        return self.rawValue
    }
}


public enum Chip: String, CustomStringConvertible {
    case m3 = "M3"
    case m3pro = "M3 Pro"
    case m3max = "M3 Max"
    
    public var description: String {
        return self.rawValue
    }
}


public enum Memory: String, CustomStringConvertible {
    case eightGB = "8GB"
    case sixteenGB = "16GB"
    case thirtySixGB = "36GB"
    
    public var description: String {
        return self.rawValue
    }
}



func buildLaptop(configuration:[String : String]) -> Laptop? {
    guard let model = configuration["base_model"] else {
        return nil
    }
    
    var laptop: Laptop?
    
    switch model {
    case "starter":
        laptop = Laptop(size: .fourteenInch, chip: .m3, memory: .eightGB)
    case "advanced":
        laptop = Laptop(size: .fourteenInch, chip: .m3pro, memory: .sixteenGB)
    case "pro":
        laptop = Laptop(size: .sixteenInch, chip: .m3max, memory: .thirtySixGB)
    default:
        print("Unexpected configuration")
        return nil
    }
    
    if let upgradedSize = configuration["size"] {
        switch upgradedSize {
        case "14-inch":
            laptop?.size = .fourteenInch
        case "16-inch":
            laptop?.size = .sixteenInch
        default:
            print("Invalid size value")
        }
    }
    
    if let upgradedChip = configuration["chip"] {
        switch upgradedChip {
        case "M3":
            laptop?.chip = .m3
        case "M3 Pro":
            laptop?.chip = .m3pro
        case "M3 Max":
            laptop?.chip = .m3max
        default:
            print("Invalid chip value")
        }
    }
    
    if let upgradedMemory = configuration["memory"] {
        switch upgradedMemory {
        case "8GB":
            laptop?.memory = .eightGB
        case "16GB":
            laptop?.memory = .sixteenGB
        case "36GB":
            laptop?.memory = .thirtySixGB
        default:
            print("Invalid memory")
        }
    }
    
    return laptop
}

// Actual builder implementation
func createBuilder(configuration: [String : String]) -> LaptopBuilder? {
    guard let model = configuration["base_model"] else {
        return nil
    }
    
    var laptopBuilder: LaptopBuilder?
    
    switch model {
    case "starter":
        laptopBuilder = StarterLaptopBuilder()
    case "advanced":
        laptopBuilder = AdvancedLaptopBuilder()
    case "pro":
        laptopBuilder = HighEndLaptopBuilder()
    default:
        print("Unexpected configuration")
        return nil
    }
    
    return laptopBuilder
    
}
