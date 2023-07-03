//
//  SNLApp.swift
//  SNL
//
//  Created by Jongwook Park on 2022/10/22.
//

import SwiftUI

@main
struct SNLApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gameData: GameData())
        }
    }
}
