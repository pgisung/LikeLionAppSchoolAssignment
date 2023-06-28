//
//  ContentView.swift
//  rockScissorsPaperGameUI
//
//  Created by JOHNNY_MAC_1 on 2023/06/26.
//

import SwiftUI

enum enumRCP: Int {
    case ROCK = 0
    case SCISSORS = -1
    case PAPER = 1
}

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button("ROCK"){
                    
                }
                Button("SCISSORS"){
                    
                }
                Button("PAPER"){
                    
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
