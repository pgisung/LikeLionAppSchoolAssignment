//
//  ContentView.swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CarView()
            .environmentObject(CarStore(cars: CarManager.getManager.carData))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
