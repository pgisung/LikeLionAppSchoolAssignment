//
//  ContentModel.swift
//  TodoListUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/05.
//

import Foundation

// Struct
struct StructTodo: Equatable, Identifiable {
    let id: UUID = UUID()
    let strTodo:String
}
