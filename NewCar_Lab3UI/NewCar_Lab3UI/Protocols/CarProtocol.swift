//
//  CarProtocol.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import Foundation

protocol Car: Identifiable {
    var modelName: String { get }
    var brand: String { get }
    var color: String { get }
    var imagePath: String { get }
    var imagePathURL: URL { get }
}

extension Car {
    var imagePathURL: URL {
        get {
            return URL(string: imagePath) ?? URL(string: "https://github.com/APPSCHOOL3-iOS%22")!
        }
    }
}
