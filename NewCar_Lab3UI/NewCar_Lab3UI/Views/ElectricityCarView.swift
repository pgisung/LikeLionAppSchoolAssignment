//
//  ElectricityCarView.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import SwiftUI

struct ElectricityCarView: View {
    var body: some View {
        List {
            NavigationLink {
                DetailView(dataStruct: honeyDreamCar2)
            }label: {
                Text(arrayElectricityCar[0].brand)
            }
            
            NavigationLink {
                DetailView(dataStruct: gyeoungYeonDreamCar2)            } label: {
                Text(arrayElectricityCar[1].brand)
            }
            
            NavigationLink {
                DetailView(dataStruct: chaeYoungDreamCar2)            } label: {
                Text(arrayElectricityCar[2].brand)
            }
            
            NavigationLink {
                DetailView(dataStruct: jiSungDreamCar2)
            } label: {
                Text(arrayElectricityCar[3].brand)
            }

            
        }
    }
}

struct ElectricityCarView_Previews: PreviewProvider {
    static var previews: some View {
        ElectricityCarView()
    }
}
