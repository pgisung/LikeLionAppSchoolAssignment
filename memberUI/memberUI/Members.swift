//
//  Members.swift
//  memberKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/14.
//

import Foundation

struct Member: Identifiable {
    var id: UUID = UUID()
    var imageName: String
    var strName: String
    var strNickName: String
}

let members: [Member] = [
    Member(imageName: "1", strName: "원강묵", strNickName: "무커"),
    Member(imageName: "2", strName: "박지성", strNickName: "조니"),
    Member(imageName: "3", strName: "정석호", strNickName: "덤보"),
    Member(imageName: "4", strName: "박정선", strNickName: "개발마스터"),
    Member(imageName: "5", strName: "김건섭", strNickName: "건빵"),
    Member(imageName: "6", strName: "안효명", strNickName: "ahn"),
    Member(imageName: "7", strName: "한아리", strNickName: "아리랑"),
    Member(imageName: "8", strName: "박재민", strNickName: "재민빡"),
]

struct gugudan: Identifiable {
    var id: UUID = UUID()
    var grade: Int
}

let grades: [gugudan] = [
    gugudan(grade: 1),
    gugudan(grade: 2),
    gugudan(grade: 3),
    gugudan(grade: 4),
    gugudan(grade: 5),
    gugudan(grade: 6),
    gugudan(grade: 7),
    gugudan(grade: 8),
    gugudan(grade: 9),
]
