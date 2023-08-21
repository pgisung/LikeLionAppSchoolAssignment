//
//  CarStore..swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import Foundation

class CarStore: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
    
    func addItems(element: Car){
        cars.append(element)
    }
    func deleteItems(at offsets: IndexSet){
        cars.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int){
        cars.move(fromOffsets: source, toOffset: destination)
    }
}

