//
//  Drink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

class NonCoffee: Drink {
    let ingredient: String
    
    init (name: String, isExpensive: Bool, ingredient: String) {
        self.ingredient = ingredient
        super.init(name: name, isExpensive: isExpensive)
    }
}
