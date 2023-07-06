//
//  ElectricityCarData.swift
//  NewCar_Lab3UI
//
//  Created by 000 on 2023/07/04.
//

import Foundation

let arrayElectricityCar: [any ElectricityCar] = [honeyDreamCar2, gyeoungYeonDreamCar2, chaeYoungDreamCar2, jiSungDreamCar2]

let honeyDreamCar2 =
BumperCar(amountOfCharge: 100, modelName: "Number-1", brand: "Samsung", color: "Lime", imagePath:"https://preview.free3d.com/img/2017/03/2146735881577301460/2gfyfwu8.jpg" )

let gyeoungYeonDreamCar2 =
Tesla(amountOfCharge: 80, modelName: "Model Y", brand: "Tesla", color: "White", imagePath: "https://cdn.discordapp.com/attachments/1087563204785352812/1125675615329194175/image.png")

let chaeYoungDreamCar2 =
Tesla(amountOfCharge: 100, modelName: "cyber truck", brand: "Tesla", color: "Silver", imagePath: "https://www.tesla.com/xNVh4yUEc3B9/04_Desktop.jpg")

let jiSungDreamCar2 =
Hyundai(amountOfCharge: 100, modelName: "Nexo", brand: "Hyundai", color: "Cafe metalic", imagePath: "https://cdn.discordapp.com/attachments/1087563204785352812/1125676904645664788/99A0884060054DF714.jpeg")
