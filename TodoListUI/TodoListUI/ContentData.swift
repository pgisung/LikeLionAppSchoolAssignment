//
//  ContentData.swift
//  TodoListUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/05.
//

import Foundation

class ContentData {
    static let CData = ContentData()
    
    var arrReceivedData: [StructTodo]
    
    private init() {
        arrReceivedData = [
            StructTodo(strTodo: "아침에 일어나면 이불 정리"),
            StructTodo(strTodo: "스위프트 기초스터디 참여"),
            StructTodo(strTodo: "하트시그널 7화 보기"),
            StructTodo(strTodo: "코스트코 가서 장 보기"),
        ]
    }
}
