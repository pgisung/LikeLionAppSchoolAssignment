//
//  Drink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

class Espresso: Coffee, HotDrink {
    var temperature: Temperature
    var bean: String
    
    // 다른 언어는 안이런데..... 팀쿡 사마..
    init(name: String, isExpensive: Bool, isHigh: Bool, taste: String, bean: String, temperature: Temperature) {
        self.temperature = temperature
        self.bean = bean
        super.init(name: name, isExpensive: isExpensive, isHigh: isHigh, taste: taste)
    }
}
