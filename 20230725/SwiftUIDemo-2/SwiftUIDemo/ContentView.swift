//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Jongwook Park on 2023/07/25.
//

import SwiftUI

struct PickColor: Identifiable, Hashable {
    var id: Int
    var color: Color
    var name: String
}

struct ContentView: View {
    var pickColors: [PickColor] = [
        PickColor(id: 0, color: .black, name: "검정"),
        PickColor(id: 1, color: .red, name: "빨강"),
        PickColor(id: 2, color: .green, name: "녹색"),
        PickColor(id: 3, color: .blue, name: "파랑"),
    ]
    
    @State private var colorIndex: Int = 0
    @State private var pickedColor: PickColor = PickColor(id: 0, color: .black, name: "검정")
    @State private var rotation: Double = 0.0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(text)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 5), value: rotation)
                .foregroundColor(pickedColor.color)
            
            Spacer()
            
            Divider()
            
            Slider(value: $rotation, in: 0...360, step: 0.1)
                .padding()
            
            TextField("[여기에 텍스트 입력]", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Picker(selection: $pickedColor, label: Text("Color")) {
                ForEach(pickColors) { pickColor in
                    Text("\(pickColor.name)")
                        .tag(pickColor)
                }
            }
            .padding()
            Spacer()
            Text("\(rotation)")
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
