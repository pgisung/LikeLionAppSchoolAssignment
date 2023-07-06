//
//  ContentView.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                
                NavigationLink {
                    OilCarView()
                }label: {
                    Text("OilCar")
                }
                
                NavigationLink {
                    ElectricityCarView()
                } label: {
                    Text("ElectricityCar")
                }

            }
            .navigationTitle("CAR")
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
