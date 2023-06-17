//
//  main.swift
//  SoccerPlayers
//
//  Created by JOHNNY_MAC_1 on 2023/06/04.
//

import Foundation

//--------------------------------------------------------------- 아래 호출부 및 예상 결과로 유추하여 작성한 선언부
/// Person 프로토콜
/// - Friend는 구조체이므로 상속이 불가능하고 Player만 클래스이기 때문에 두 타입에 공통적으로 작성될 부분에 대하여 프로토콜 작성
protocol Person {
    var name: String { get }
    init (name: String)
    func displayname() -> String
}

/// Person 익스텐션
/// - Person프로토콜에 존재하는 구문중 익스텐션에 공통으로 구현할 수 있는 displayname() -> String 메서드만 구현
/// - name 연산 프로퍼티도 작성 가능하지만 생략
extension Person {
    func displayname() -> String {
        var strReturn: String = "\(name) 선수"
        return strReturn
    }
}

/// Player 클래스
/// - name프로퍼티를 연산 프로퍼티로 선언: 호출될 시 m_strName저장 프로퍼티에 입력을 받고 반환함
/// - 상속이 가능한 class는 프로토콜에 initializer 요구가 존재할 시 해당 init 생성자 앞에 required 식별자를 붙여야함
class Player: Person {
    var m_strName: String
    var name: String {
        get {
            return m_strName
        }
        set {
            m_strName = newValue
        }
    }
    
    required init (name: String) {
        m_strName = name
    }
}

/// Friend 구조체
/// - name프로퍼티를 저장 프로퍼티로 선언 및 초기화
struct Friend: Person {
    var name: String
    
    init (name: String) {
        self.name = name
    }
}

//--------------------------------------------------------------- 호출부
// Player라는 이름을 가진 구조체 또는 클래스 필요, 이 타입은 name이라는 매개변수명을 가지며 String타입인 매개변수 한개를 받아 초기화를 진행함
let playerOne: Player = Player(name: "호날두")
// 인스턴스 복제
let playerTwo: Player = playerOne
// Player라는 이름을 가진 구조체 또는 클래스는 name이라는 String타입의 프로퍼티를 가짐 (저장프로퍼티인지 연산프로퍼티인지는 이 단계에서 판단 불가능)
playerOne.name = "메시"
// Player라는 이름을 가진 타입은 클래스임
// - 원래 playerOne인스턴스의 name프로퍼티 값은 "호날두"임
// - playerOne인스턴스가 playerTwo인스턴스로 복제되었고
// - playerOne의 name프로퍼티 값만 "메시"로 변경하였는데
// - 출력된 결과에선 playerOne, playerTwo 모두의 name프로퍼티가 "메시"로 변경되었으므로
// - let playerTwo: Player = playerOne에서 인스턴스가 복제될 때 call by reference로 실행되었음을 추정가능 함
//
// Player 클래스는 displayname이라는 이름과 () -> String 타입을 가진 메서드를 갖고있으며
// 이 메서드는 문자열을 반환할 때 "\(name) 선수"의 형태로 반환함
print("P1: \(playerOne.displayname())") // P1: 메시 선수
print("P2: \(playerTwo.displayname())") // P2: 메시 선수

// Friend라는 이름을 가진 구조체 또는 클래스 필요, 이 타입은 name이라는 매개변수명을 가지며 String타입인 매개변수 한개를 받아 초기화를 진행함
var friendOne: Friend = Friend(name: "둘리")
// 인스턴스 복제
var friendTwo: Friend = friendOne
// Friend라는 이름을 가진 구조체 또는 클래스는 name이라는 String타입의 프로퍼티를 가짐 (저장프로퍼티인지 연산프로퍼티인지는 이 단계에서 판단 불가능)
friendOne.name = "도우너"
// Friend라는 이름을 가진 타입은 구조체임
// - 원래 friendOne인스턴스의 name프로퍼티 값은 "둘리"임
// - friendOne인스턴스가 friendTwo인스턴스로 복제되었고
// - friendOne의 name프로퍼티 값을 "도우너"로 변경하였는데
// - 출력된 결과에선 friendOne의 name프로퍼티만 "도우너"로 변경되었고
// - friendTwo의 name프로퍼티는 friendOne이 초기화되고 friendTwo로 복제될 당시의 "둘리"라는 값을 그대로 지니고 있으므로
// - var friendTwo: Friend = friendOne에서 인스턴스가 복제될 때 call by value로 실행되었음을 추정가능 함
//
// Friend 구조체는 displayname이라는 이름과 () -> String 타입을 가진 메서드를 갖고있으며
// 이 메서드는 문자열을 반환할 때 "\(name) 선수"의 형태로 반환함
print("F1: \(friendOne.displayname())") // F1: 도우너 선수
print("F2: \(friendTwo.displayname())") // F2: 둘리 선수
