//
//  ExtensionHotDrink.swift
//  DrinkUI
//
//  Created by JOHNNY_MAC_1 on 2023/07/03.
//

import Foundation

extension HotDrink {
    func cooling() -> Temperature {
        guard temperature != .warm else {
            print("넌 뜨겁지 않아")
            return temperature
        }
        
        let tempTemperature: Temperature = .warm
        
        return tempTemperature
    }
}

//------------------
// 메소드 오버로딩 = 메소드 중복정의
func overload1 () {
    
}
func overload1 (_ aaa: Int) {
    
}
func overload1 (_ str: String) {
    
}

//overload1()
//overload1(0)
//overload1("나")

//------------------
// 메소드 오버라이딩 = 메소드 재정의
// 부모 함수 맘에 안들어 내가 다시 만들래
override func overload1 () {
    
}



// 익스텐션이라는 애가
// 다른 언어에서는 분할 클래스 또는 확장 클래스라고 불렸거든여

//extension Latte {
//    func 아무거나 () {
//
//    }
//}

//class a {
//    let aa
//    var bb
//}
//
//// 범위가 약간 줄어들었어요 그래서 연산프로퍼티랑, 메서드만 가능
//extension a {
//    func ccc() {}
//    func ddd(){}
//}
//
//
//class b {
//
//}


//func aaa () {
//    if isStudent() {
//
//    }
//}
//
//func isStudent() -> Bool {
//    var bReturn: Bool = false
//
//    repeat {
//        guard true else {
//
//        }
//
//        guard true else {
//
//        }
//
//        guard true else {
//
//        }
//
//        guard true else {
//
//        }
//
//        bReturn = true
//    } while (false)
//
//    return bReturn
//}
