//
//  Drink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

enum JuiceType {
    case Smoothie
    case Blended
    case Frappe
}

class Juice: NonCoffee, ColdDrink {
    var isIce: Bool
    var whippingCream: AmountOfWhippingCream
    var juiceType: JuiceType
    
    init (name: String, isExpensive: Bool, ingredient: String, juiceType: JuiceType, isIce: Bool, whippingCream: AmountOfWhippingCream) {
        self.isIce = isIce
        self.whippingCream = whippingCream
        self.juiceType = juiceType
        super.init(name: name, isExpensive: isExpensive, ingredient: ingredient)
    }
    
    func melting() -> Int {
        var ice: Int = 8
        for _ in 0...ice {
            ice -= 1
        }
        return ice
    }
}
