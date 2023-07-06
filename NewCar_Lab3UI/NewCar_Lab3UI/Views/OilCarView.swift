//
//  OilCarView.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import SwiftUI

struct OilCarView: View {
    var body: some View {
        List {
        
            NavigationLink {
                DetailView(dataStruct: jiSungDreamCar)
            }label: {
                Text(arrayOilCar[0].brand)
            }
            
            NavigationLink {
                DetailView(dataStruct: chaeYoungDreamCar)
            } label: {
                Text(arrayOilCar[1].brand)
            }
            
            NavigationLink {
                DetailView(dataStruct: gyeoungYeonDreamCar)
            }label: {
                Text(arrayOilCar[2].brand)
            }
            
            NavigationLink {
                DetailView(dataStruct: HoneyDreamCar)
            } label: {
                Text(arrayOilCar[3].brand)
            }

        }
    }
}

struct OilCarView_Previews: PreviewProvider {
    static var previews: some View {
        OilCarView()
    }
}
