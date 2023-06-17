//
//  ContentView.swift
//  StudentUI
//
//  Created by JOHNNY_MAC_1 on 2023/06/14.
//

import SwiftUI

struct ContentView: View {
    @State var message: String = "Select a student"
    
    var body: some View {
        VStack {
            Text(message)
            
            // students의 내용들을 하나씩 꺼내서
            // 그 이름을 student라고 하고
            // 활용해서 각 줄을 구성하는 목록 만들기
            // (알고보니 in이라는 거 보니까 클로저네)
            List(students) { student in
                Button {
                    message = "Hello \(student.name) #\(student.number)"
                } label: {
                    HStack {
                        Text("\(student.name)")
                        Spacer()
                        Text("\(student.number)")
                    }
                }
            }
        }
        .font(.largeTitle)
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
