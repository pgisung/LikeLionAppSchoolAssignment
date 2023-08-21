//
//  CarManager.swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import Foundation

final class CarManager {
    static let getManager: CarManager = CarManager()
    
    var carData: [Car] = JsonManager.getManager.loadJson("carData.json")
    
    private init(){
        
    }
}
