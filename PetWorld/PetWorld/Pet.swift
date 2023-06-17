//
//  Pet.swift
//  PetWorld
//
//  Created by Jongwook Park on 2023/06/14.
//

import Foundation

struct Pet: Identifiable {
    var id: UUID = UUID()
    var name: String
    var kind: String
    var imageName: String
    var friendName: String
}

let pets: [Pet] = [
    Pet(name: "모찌", kind: "멍멍이", imageName: "001", friendName: "정설아"),
    Pet(name: "무지", kind: "야옹이", imageName: "002", friendName: "한아리"),
    Pet(name: "몽", kind: "야옹이", imageName: "003", friendName: "박믿음"),
    Pet(name: "동지", kind: "야옹이", imageName: "004", friendName: "정한두"),
    Pet(name: "둘리", kind: "공룡", imageName: "005", friendName: "고길동"),
]
