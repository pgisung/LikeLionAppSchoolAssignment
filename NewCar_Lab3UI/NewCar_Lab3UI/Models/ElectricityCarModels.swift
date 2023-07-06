//
//  ElectricityCarModel.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import Foundation

struct BumperCar: ElectricityCar {
    var id:UUID = UUID()
    var amountOfCharge: Int
    var modelName: String
    var brand: String
    var color: String
    var imagePath: String

}

struct Tesla: ElectricityCar {    
    var id:UUID = UUID()
    var amountOfCharge: Int
    var modelName: String
    var brand: String
    var color: String
    var imagePath: String

}

struct Hyundai: ElectricityCar {
    var id:UUID = UUID()
    var amountOfCharge: Int
    var modelName: String
    var brand: String
    var color: String    
    var imagePath: String

}
