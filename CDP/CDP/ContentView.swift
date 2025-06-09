//
//  ContentView.swift
//  CDP
//
//  Created by Praveen Jangre on 06/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            //Singleton Implementation
            implementSingleton()
            
            //Prototype design pattern implementation
            implementPrototypeAsStruct()
            implementPrototypeForClassType()
            
            
            // Builder design pattern implementation
            implementBuilderDesignPattern()
            
            
            // Factory design pattern implementation
            implementingFactoryPattern()
            
            // Abstract Factory design pattern implementation
            implementationOfAbstractFactoryPattern()
        }
    }
}

#Preview {
    ContentView()
}
