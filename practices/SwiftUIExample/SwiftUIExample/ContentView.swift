//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 아라 on 2023/07/24.
//

import SwiftUI

struct ContentView: View {
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0.0
    @State private var text: String = "Welecome to SwiftUI"
    
    var body: some View {
        VStack() {
            Spacer()
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                // rotation 값이 바뀌는 거에 따라서 애니매이션이 달라짐 변화 감지!
            
                .animation(.easeOut(duration: 4), value: rotation)
                .foregroundColor(colors[colorIndex])
            Spacer()
            Divider()
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle)
                .padding()
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach( 0..<colornames.count, id: \.self) {
                    Text(colornames[$0])
                        .foregroundColor(colors[$0])
                }
            }
            .pickerStyle(.menu)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
