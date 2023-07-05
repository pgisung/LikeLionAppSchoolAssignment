//
//  ProtocolHotDrink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

enum Temperature {
    case warm
    case hot
}

protocol HotDrink {
    var temperature: Temperature { get set }
    func cooling() -> Temperature
}
