//
//  FactoryPattern.swift
//  CDP
//
//  Created by Praveen Jangre on 08/06/2025.
//

import Foundation


func implementingFactoryPattern() {
    let jsonEncoder = MyEncoderFactory.makeEncoder(type: .json)
    
    let encodedJson = jsonEncoder.encode(text: "Hello, JSON text")
    print("encodedJson: \(encodedJson)")
    
    let base64Encoder = MyEncoderFactory.makeEncoder(type: .base64)
    let encodedBase64 = base64Encoder.encode(text: "Hello, Base64 text")
    print("Encoded base64: \(encodedBase64)")
    
    let htmlEncoder = MyEncoderFactory.makeEncoder(type: .html)
    let encodedHtml = htmlEncoder.encode(text: "Hello, HTML text")
    print("Encode HTML: \(encodedHtml)")
    
    
}







public protocol Encoder {
    func encode(text: String) -> String
}

public protocol EncoderFactory {
    static func makeEncoder(type: EncoderType) -> Encoder
}


public struct JsonEncoder: Encoder {
    public func encode(text: String) -> String {
        print("Encoding in JSON format")
        return "{\"message \": \"\(text)\"}" //Dummy logic to showcase the pattern
    }
    public init() {}
}

public struct Base64Encoder: Encoder {
    public func encode(text: String) -> String {
        print("Encoding in Base64 format")
        
        //Actual implementation of Base64 encoding
        if let data = text.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return "Failed to encode"
    }
    public init() {}
}


public struct HtmlEncoder: Encoder {
    public func encode(text: String) -> String {
        print("Encoding in HTML format")
        
        //Dummy implementation to show pattern implementation

        return "<html><body><p></p>\(text)</body></html>"
    }
    public init() {}
}




public enum EncoderType {
    case json
    case base64
    case html
}

extension EncoderFactory {
    public static func makeEncoder(type: EncoderType) -> Encoder {
        switch type {
        case .json:
            JsonEncoder()
        case .base64:
            Base64Encoder()
        case .html:
            HtmlEncoder()
        }
    }
}


public class MyEncoderFactory: EncoderFactory {
    
}
