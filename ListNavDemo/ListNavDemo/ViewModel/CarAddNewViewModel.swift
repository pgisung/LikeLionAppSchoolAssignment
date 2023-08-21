//
//  CarAddNewViewModel.swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import Foundation

class CarAddNewViewModel: ObservableObject {
    @Published var isHybrid: Bool = false
    @Published var name: String = ""
    @Published var description: String = ""
    
    func doAddNewCar(_ store: CarStore){
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "\(store.cars.randomElement()?.imageName ?? "tesla_model_3")")
        
        store.addItems(element: newCar)
    }
}
