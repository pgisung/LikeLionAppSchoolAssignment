//
//  Drink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

class Coffee: Drink {
    var isHigh: Bool
    var taste: String
    
    init (name: String, isExpensive: Bool, isHigh: Bool, taste: String) {
        self.isHigh = isHigh
        self.taste = taste
        super.init(name: name, isExpensive: isExpensive)
    }
}

