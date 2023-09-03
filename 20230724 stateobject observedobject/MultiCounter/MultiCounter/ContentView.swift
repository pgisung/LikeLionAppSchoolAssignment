//
//  ContentView.swift
//  MultiCounter
//
//  Created by Jongwook Park on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countStore = CountStore()
    
    var body: some View {
        VStack {
            HStack {
                Text("\(countStore.count)")
                    .padding()
                
                Button {
                    countStore.count += 1
                } label: {
                    Text("Plus One")
                }
            }
            
            StateCountView()
            ObservedCountView()
        }
        .padding()
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
