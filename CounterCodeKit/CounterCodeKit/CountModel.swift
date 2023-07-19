//
//  CountModel.swift
//  CounterCodeKit
//
//  Created by SONYOONHO on 2023/07/19.
//

import Foundation

final class CountModel {
    static var getModel: CountModel = CountModel()
    
    var count: Int
    
    private init() {
        count = 0
    }
}

//let countModel = CountModel.getModel
