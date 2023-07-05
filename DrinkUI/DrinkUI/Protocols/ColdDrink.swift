//
//  ColdDrink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

enum AmountOfWhippingCream {
    case none
    case middle
    case much
}

protocol ColdDrink {
    var isIce: Bool { get set }
    var whippingCream: AmountOfWhippingCream { get set }
    // 얼음이 있을테니까.. 반드시 녹아야해..
    func melting() -> Int
}
