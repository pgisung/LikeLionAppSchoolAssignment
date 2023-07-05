//
//  Drink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

class Latte: Coffee, HotDrink {
    var temperature: Temperature
    var milkType: String
    
    init(name: String, isExpensive: Bool, isHigh: Bool, taste: String, milkType: String, temperature: Temperature) {
        self.temperature = temperature
        self.milkType = milkType
        super.init(name: name, isExpensive: isExpensive, isHigh: isHigh, taste: taste)
    }
}
