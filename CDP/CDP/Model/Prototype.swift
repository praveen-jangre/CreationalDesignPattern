//
//  Prototype.swift
//  CDP
//
//  Created by Praveen Jangre on 08/06/2025.
//

import Foundation


struct Point {
    var x: Int
    var y: Int
}


func implementPrototypeAsStruct() {
    var point1 = Point(x: 0, y: 0)

    var point2 = point1

    point2.x = 100
    point2.y = 200
    
    print("Protyping for Struct")
    print("point1 = \(point1) \n point2 = \(point2)")
    print("-----------------------------------------")
}


class PointClass {
    var x: Int
    var y: Int
    var shape: Shape
    
    init(x: Int, y: Int, shape: Shape) {
        self.x = x
        self.y = y
        self.shape = shape
    }
}

extension PointClass: NSCopying
{
    func copy(with zone: NSZone? = nil) -> Any {
        PointClass(x: self.x, y: self.y, shape: self.shape)
    }
}

extension PointClass: CustomStringConvertible {
    var description: String {
        "Point (\(x), \(y), \(shape)"
    }
    
}

func implementPrototypeForClassType()  {
    var point1 = PointClass(x: 45, y: 90, shape: Shape(type: "Circle", size: 15))

    var point2 = point1.copy() as! PointClass

    point2.x = 10
    point2.y = 900
    point2.shape = Shape(type: "Rectangle", size: 4)
    print("Prototyping for Classes")
    print("point1 = \(point1) \n point2 = \(point2.description)")
    print("-----------------------------------------")
    
}


class Shape {
    var type: String
    var size: Int
    
    init(type: String, size: Int) {
        self.type = type
        self.size = size
    }
}

extension Shape: CustomStringConvertible {
    var description: String {
        "Shape (\(type), \(size))"
    }
}



