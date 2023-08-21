//
//  CarAddNewView.swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import SwiftUI

struct CarAddNewView: View {
    @EnvironmentObject var carStore: CarStore
    @StateObject var carAddNewViewModel: CarAddNewViewModel = CarAddNewViewModel()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Car Details")){
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                DataInputView(title: "Model", userInput: $carAddNewViewModel.name)
                DataInputView(title: "Description", userInput: $carAddNewViewModel.description)
                
                Toggle(isOn: $carAddNewViewModel.isHybrid) {
                    Text("Hybrid").font(.headline)
                }.padding()
            }
            
            Button {
                carAddNewViewModel.doAddNewCar(carStore)
                isPresented = false
            } label: {
                Text("Add Car")
            }
        }
    }
}

struct CarAddNewView_Previews: PreviewProvider {
    static var previews: some View {
        CarAddNewView(isPresented: .constant(true))
            .environmentObject(CarStore(cars: CarManager.getManager.carData))
    }
}
