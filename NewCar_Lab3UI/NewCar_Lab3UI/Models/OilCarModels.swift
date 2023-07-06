//
//  OilCarModels.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import Foundation

struct Lamborghini:OilCar {
    var id:UUID = UUID()
    var oilType: OilType
    var fuelEfficiency: Float
    var modelName: String
    var brand: String
    var color: String
    var imagePath: String
}


struct Porsche:OilCar {
    var id:UUID = UUID()
    var oilType: OilType
    var fuelEfficiency: Float
    var modelName: String
    var brand: String
    var color: String
    var imagePath: String
}


struct Bugatti:OilCar {
    var id:UUID = UUID()
    var oilType: OilType
    var fuelEfficiency: Float
    var modelName: String
    var brand: String
    var color: String
    var imagePath: String
}

struct Ferrari:OilCar {
    var id:UUID = UUID()
    var oilType: OilType
    var fuelEfficiency: Float
    var modelName: String
    var brand: String
    var color: String
    var imagePath: String
}
