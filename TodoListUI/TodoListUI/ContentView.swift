//
//  ContentView.swift
//  TodoListUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var objContentStore = ContentStore()
    @State var inputTodoText: String = ""

    var body: some View {
        VStack {
            List(objContentStore.arrTodoList, id: \.id) { todoList in
                TodoView(objTodoList: todoList, objContentStore: objContentStore)
            }
            VStack {
                TextField("Plase Input what you would like to do", text: $inputTodoText)
                Button("할일 추가") {
                    // 저쪽 뷰모델에 todoList에 뭔가 추가 해야되...
                    objContentStore.addTodoList(strTodo: inputTodoText)
                    // 입력이 끝나면 이전 문자는 사라져야해...
                    flushList()
                }
            }
            .padding()
        }
    }
    
    // 이거슨 View에 존재하는 inputTodoText 파라미터니까 View에서 초기화 해주면 된다 //////////
    func flushList() {
        inputTodoText = ""
    }
}

struct TodoView: View {
    var objTodoList: StructTodo
    var objContentStore: ContentStore
    
    var body: some View {
        Group {
            HStack {
                Text(objTodoList.strTodo)
                Spacer()
                Button("완료") {
                    // 저쪽 뷰모델에 todoList에 뭔가 삭제 해야되...
                    objContentStore.removeTodoList(objTodoList)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
