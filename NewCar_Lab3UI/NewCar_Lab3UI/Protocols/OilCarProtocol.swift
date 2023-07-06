//
//  File.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import Foundation

enum OilType {
    case gasoline
    case diesel
}


protocol OilCar: Car {
    var oilType: OilType { get }
    var fuelEfficiency: Float { get }
}
