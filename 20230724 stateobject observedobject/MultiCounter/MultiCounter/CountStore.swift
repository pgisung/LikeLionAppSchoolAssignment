//
//  CountStore.swift
//  MultiCounter
//
//  Created by Jongwook Park on 2023/07/19.
//

import Foundation

class CountStore: ObservableObject {
    @Published var count: Int = 0
}
