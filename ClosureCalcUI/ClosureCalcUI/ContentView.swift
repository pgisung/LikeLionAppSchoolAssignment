//
//  ContentView.swift
//  ClosureCalcUI
//
//  Created by Jongwook Park on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    
    @State var number1: Int = 0
    @State var number2: Int = 0
    
    @State var oprFunc: (Int, Int) -> Int = { (n1: Int, n2: Int) -> Int in
        return n1 + n2
    }
    
    @State var resultString: String = "위에서 아래로 순서대로 선택해주세요"
    
    var body: some View {
        VStack {
            Text("\(resultString)")
                .font(.largeTitle)
            
            HStack {
                Button {
                    number1 = 10
                } label: {
                    ButtonView(buttonString: "10")
                }
                
                Spacer()
                
                Button {
                    number1 = 20
                } label: {
                    ButtonView(buttonString: "20")
                }
                
                Spacer()
                
                Button {
                    number1 = 30
                } label: {
                    ButtonView(buttonString: "30")
                }
            }
            
            HStack {
                Button {
                    oprFunc = { (n1: Int, n2: Int) -> Int in
                        return n1 * n2
                    }
                } label: {
                    ButtonView(buttonString: "x")
                }
                
                Spacer()
                
                Button {
                    oprFunc = { (n1: Int, n2: Int) -> Int in
                        return n1 / n2
                    }
                } label: {
                    ButtonView(buttonString: "/")
                }
                
                Spacer()
                
                Button {
                    oprFunc = { (n1: Int, n2: Int) -> Int in
                        return n1 + n2
                    }
                } label: {
                    ButtonView(buttonString: "+")
                }
            }
            
            HStack {
                Button {
                    number2 = 3
                } label: {
                    ButtonView(buttonString: "3")
                }
                
                Spacer()
                
                Button {
                    number2 = 6
                } label: {
                    ButtonView(buttonString: "6")
                }
                
                Spacer()
                
                Button {
                    number2 = 9
                } label: {
                    ButtonView(buttonString: "9")
                }
            }
            
            Button {
                let result: Int = oprFunc(number1, number2)
                
                resultString = "\(result)"
            } label: {
                ButtonView(buttonString: "Calc")
            }
        }
        .font(.title)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
