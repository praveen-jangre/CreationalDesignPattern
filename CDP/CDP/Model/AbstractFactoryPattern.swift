//
//  AbstractFactoryPattern.swift
//  CDP
//
//  Created by Praveen Jangre on 09/06/2025.
//

//Abstract Factory Pattern
//Provides an abstraction for creating families of related or dependent objects.
// Enables the creation of families of related objects
// Clients interact with factory and product abstractions
// Decouples calles from the concrete factory and product types

//Benefits
// Removes client code's dependence on concrete factories and products
// Allows changes in factories or products without affecting dependent components
// Simplifies creating various object families by switching factories
// Overkill for single object creation, consider the factory method instead


import Foundation


struct Computer: CustomStringConvertible {
    var finish: Finish
    var processor: Processor
    var graphics: Graphics
    
    var price: Int {
        return finish.price + processor.price + graphics.price
    }
    
    var description: String {
        "\nYour configuration: \n\tFinish: \(finish.color)\n\tProcessor: \(processor.type)\n\tGraphics: \(graphics.card)\n\tTotal Price: $\(price)"
    }
    
}


func implementationOfAbstractFactoryPattern() {
    
    var factory = ComputerFactory.makeFactory(type: .office)
    
    if let officeComputer = createComputer(factory: factory) {
        print(officeComputer)
    }
    
    factory = ComputerFactory.makeFactory(type: .highEnd)
    if let highEndComputer = createComputer(factory: factory) {
        print(highEndComputer)
    }
}

//Abstract Factory Implementation

public class ComputerFactory {
    public func chooseFinish() -> Finish? { nil }
    public func chooseProcessor() -> Processor? { nil }
    public func chooseGraphics() -> Graphics? { nil }
    
    public final class func makeFactory(type: ComputerType) -> ComputerFactory{
        switch type {
        case .office:
            OfficeComputerFactory()
        case .highEnd:
            HighEndComputerFactory()
        }
    }
}

public enum ComputerType {
    case office
    case highEnd
}

private class OfficeComputerFactory: ComputerFactory {
    override func chooseFinish() -> Finish? { Silver() }
    override func chooseProcessor() -> Processor? { Fast() }
    override func chooseGraphics() -> Graphics? { Standard() }
    
}
private class HighEndComputerFactory: ComputerFactory {
    override func chooseFinish() -> Finish? { SpaceGray() }
    override func chooseProcessor() -> Processor? { Turbo() }
    override func chooseGraphics() -> Graphics? { Ultra() }
}

func createComputer(factory: ComputerFactory) -> Computer? {
    guard let finish = factory.chooseFinish(),
            let processor = factory.chooseProcessor(),
            let graphics = factory.chooseGraphics() else { return nil }
    return Computer(finish: finish, processor: processor, graphics: graphics)
}
