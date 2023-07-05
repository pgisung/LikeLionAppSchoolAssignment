//
//  Drink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

class Drink: Identifiable {
    let id: UUID = UUID()
    var name: String
    var isExpensive: Bool
    
    init (name: String, isExpensive: Bool) {
        self.name = name
        self.isExpensive = isExpensive
    }
}
