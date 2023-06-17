//
//  Students.swift
//  StudentKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/14.
//

import Foundation

// List에서 Student의 배열이 활용되려면
// Identifiable 프로토콜을 따라야 한다
// Identifiable 프로토콜은 개별적으로 구분되어 겹치지 않는 값으로
// id라는 프로퍼티들을 강제로 요구한다
struct Student: Identifiable {
    var id: UUID = UUID()// 이렇게 id 만들면 Identifiable을 따른다고 하는 국룰!
    var number: Int
    var name: String
    
//    init(number: Int, name: String) {
//        self.number = number
//        self.name = name
//    }
}

// 하드코딩 : 직접 데이터를 심어버리는 코딩
// 이 students라는 이름의 인스턴스는
// 이 프로젝트 어느 코드에서도 호출해서 쓸 수 있는
// 전역상수가 된다
let students: [Student] = [
    Student(number: 201, name: "김윤지"),
    Student(number: 202, name: "최소정"),
    Student(number: 204, name: "한현민"),
    Student(number: 205, name: "봉주헌"),
    Student(number: 206, name: "송성욱"),
    Student(number: 207, name: "김상규"),
    Student(number: 301, name: "한채린"),
    Student(number: 302, name: "나예슬"),
    Student(number: 303, name: "이승준_1"),
    Student(number: 304, name: "김종찬"),
    Student(number: 305, name: "임하니"),
    Student(number: 306, name: "주진형"),
    Student(number: 307, name: "남형식"),
]
