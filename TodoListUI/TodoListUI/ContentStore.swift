//
//  ContentStore.swift
//  TodoListUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/05.
//

import Foundation

// Store
class ContentStore: ObservableObject {
    @Published var arrTodoList: [StructTodo]
    
    init (){
        arrTodoList = ContentData.CData.arrReceivedData
    }
    
    func addTodoList (strTodo: String) {
        // 예외처리
        guard strTodo != "" else {
            arrTodoList.append(StructTodo(strTodo: "이야아아아아아압!!!!!!!"))
            return
        }
        
        arrTodoList.append(StructTodo(strTodo: strTodo))
    }
    
    func removeTodoList(_ objTarget: StructTodo) {
        // 한줄로도 지울 수 있다
//        arrTodoList.removeAll(where: { $0.id == objTarget.id })
        for element in arrTodoList {
            if element.id == objTarget.id {
                let index: Int = arrTodoList.firstIndex(of: element) ?? 0
                arrTodoList.remove(at: index)
            }
        }
    }
}

