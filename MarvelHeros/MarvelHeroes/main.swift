//
//  main.swift
//  MarvelHeros
//
//  Created by JOHNNY_MAC_1 on 2023/06/02.
//

import Foundation

///-------------------------------
/// This document written by Hungarian Notation
///-------------------------------

/// 열거형 enumeration으로 어벤져스 멤버 및 팀 정의 부분
/// - 아래 열거형에 원하는 팀 및 영웅 추가 그리고 제거에 따라 전체 동작이 달라지도록 구현 (미완료)
enum enumMemberOfAvengers : String, CaseIterable {
    case IRON_MAN = "Iron Man"
    case CAPTAIN_AMERICA = "Captain America"
    case BLACK_WIDOW = "Black Widow"
    case HAWKEYE = "Hawkeye"
    case VISION = "Vision"
    case WANDA = "Wanda"
    case SPIDER_MAN = "Spider Man"
    case ANT_MAN = "Ant Man"
    case WAR_MACHINE = "War Machine"
    case PALCON = "Palcon"
}
enum enumTeamOfAvengers : Int, CaseIterable {
    case TEAM_IRON_MAN = 0
    case TEAM_CAPTAIN_AMERICA
}

/// 영웅이라면 가져야할 소양 프로토콜로 선언
/// - m_strNickName: 각 영웅은 다른 사람들이 바꿀 수 없는 고유의 별칭을 갖고있으므로 getter만 추가
/// ( but, 상속 받은 서브클래스는 Setter 추가 가능 )
/// - doGreet() : 영웅으로써 필수적인 인사 메서드가 정의 되어야 함
/// , 출력할 문자열에 필요한 프로퍼티들은 각 클래스가 상수형태로 갖고있으므로 따로 매개변수 추가하지 않음
/// - doChooseProperStringToken (iHeroIndex: Int) -> String : 영웅번호에 따라 순번 문자 토큰 다르게 출력하기 위한 메서드
/// , iHeroIndex : 정수형 매개변수
/// , 결과로 문자열 반환
protocol ProtHeroable {
    var m_strNickName: String { get }
    func doGreet()
    func doChooseProperStringToken (iHeroIndex: Int) -> String
}

/// 프로토콜에서 선언된 문자열 토큰 반환 메서드 익스텐션안에 정의
/// - switch구문 안에서 사용되는 정수형 변수 예외 처리, CAvengers.s_iMemberCount > 3 ? CAvengers.s_iMemberCount : 4
/// - 각 영웅이 가진 고유번호에 따라 순번 문자열 토큰 다르게 정의, switch (iHeroIndex)
/// - 결과 문자열이 nil이 아닐 경우 반환, if let strResultOptional: String = strResult
extension ProtHeroable {
    func doChooseProperStringToken (iHeroIndex: Int) -> String {
        var strResult: String?
        var iMemberCount: Int {
            CAvengers.s_iMemberCount > 3 ? CAvengers.s_iMemberCount : 4
        }
        
        switch (iHeroIndex) {
        case 1:
            strResult = "st"
        case 2:
            strResult = "nd"
        case 3:
            strResult = "rd"
        case 4... where iHeroIndex <= iMemberCount:
            strResult = "th"
        default:
            strResult = "th"
            print("There is no the hero index in condition of switch syntax")
            break
        }
        
        if let strResultOptional: String = strResult {
            return strResultOptional
        } else {
            return "th"
        }
    }
}

/// 프로토콜로 강제되진 않았지만 선언된 익스텐션
/// - showEasterEgg(strJustice: String) 아이언맨 진영으로 선언된 영웅들만 호출 가능한 문자열 출력하는 메서드
/// - , strJustice: CHeroIronManTeam 인스턴스가 생성될 때 초기화되는 m_strJustification를 인자로 받음
extension CHeroIronManTeam {
    func showEasterEgg (strJustice: String) {
        if strJustice == "Justice" {
            print("We need appropriate control for the \(strJustice)")
        } else {
            print("\(strJustice)")
        }
    }
}

/// 프로토콜로 강제되진 않았지만 선언된 익스텐션
/// - showEasterEgg(m_bIsThereGuilty: Bool) 캡틴 아메리카 진영으로 선언된 영웅들만 호출 가능한 문자열 출력하는 메서드
/// - ,bIsThereGuilty: CHeroCaptainTeam 인스턴스가 생성될 때 초기화되는 m_bIsThereGuilty를 인자로 받아
/// 삼항연산자를 사용하여 결과가 true일 경우 :의 왼쪽 구문 출력 false일 경우 :의 오른쪽 구문 출력
extension CHeroCaptainTeam {
    func showEasterEgg (bIsThereGuilty: Bool) {
        bIsThereGuilty ? print("We are sorry for all you suffered") : print("There is no even the slightest bit of guilty")
    }
}

/// Integer 구조체에 홀수, 짝수 여부를 구분하여 결과를 반환해주는 연산 프로퍼티를 익스텐션을 이용하여 추가
/// - bIsOddNum: self가 홀수일 시 true, self가 짝수일 시 false, 길게 구현
/// - bIsEvenNum: self가 짝수일 시 true, self가 홀수일 시 false, 가능한 생략해서 구현
extension Int {
    var bIsOddNum: Bool {
        get {
            return self % 2 == 1
        }
    }
    var bIsEvenNum: Bool {
        self % 2 == 0
    }
}

/// 모든 영웅 인스턴스들을 실제로 다루는 어벤져스 클래스 선언
class CAvengers {
    // 싱글톤 테스트
    //    private static var m_objAvengers: CAvengers?
    //    public static var GetAvengers: CAvengers {
    //        get {
    //            if let m_objAvengersOptional: CAvengers = m_objAvengers {
    //                return m_objAvengersOptional
    //            } else {
    //                m_objAvengers = CAvengers()
    //                if let m_objAvengersOptional: CAvengers = m_objAvengers {
    //                    return m_objAvengersOptional
    //                }
    //            }
    //        }
    //    }
    
    // 각 팀별 배열 및 각 배열안에 영웅 인스턴스를 저장하는 루트 배열 선언
    var m_arrAllGroups: [Array<CHero>] = []
    // enumMemberOfAvengers에 존재하는 모든 영웅들의 이름을 복사하여 저장중인 배열 선언
    var m_arrNameOfAvengers: [String] = []
    // 생성되어 있는 영웅 인스턴스들의 카운트 변수 ( 타입 프로퍼티로 인스턴스 생성 없이도 호출은 가능하나 어벤져스 인스턴스 및 영웅 인스턴스 생성전에는 0 값을 가짐 )
    public static var s_iMemberCount: Int {
        get {
            var iResult = 0
            for arrTeam in objAvengers.m_arrAllGroups {
                iResult += arrTeam.count
            }
            return iResult
        }
    }
    
    /// 생성자 - 인스턴스 생성시 최초 진입 부분
    init () {
        // 최종적으로 영웅 인스턴스를 저장할 배열 초기화: m_arrAllGroups
        for _ in enumTeamOfAvengers.allCases {
            m_arrAllGroups.append(Array<CHero>())
        }
        // 각 영웅의 이름을 담은 배열 초기화: m_arrNameOfAvengers
        enumMemberOfAvengers.allCases.forEach({
            m_arrNameOfAvengers.append($0.rawValue)
        })
    }
    
    /// strName으로 전달되는 문자열 인자값과 일치하는 이름을 가진 영웅을 찾아 반환하는 메서드
    func doCallAvenger(_ strName: String) -> CHero? {
        var objHero: CHero?
        for iTeamCount in 0 ..< m_arrAllGroups.count {
            if let objHeroOptional: CHero = m_arrAllGroups[iTeamCount].first(where: { $0.m_strNickName == strName }) {
                objHero = objHeroOptional
            }
        }
        
        if let objHeroOptional: CHero = objHero {
            return objHeroOptional
        } else {
            print("Unfortunately there is no such an Avenger")
            return nil
        }
    }
    
    /// enumTeam으로 전달되는 인자 enum의 rawValue 정수값에 따른 팀 배열([CHero]) 반환하는 메서드
    func doCallAvengersTeam (_ enumTeam: enumTeamOfAvengers) -> [CHero] {
        m_arrAllGroups[enumTeam.rawValue]
    }
    
    /// 입력된 배열의 구성원 순서를 무작위로 바꿔주는 메서드
    /// - objArray가 매개변수로 입력되면 objArray.shuffled()를 통해 배열을 서플후에 inout 입출력 매개변수를 통해 기존의 배열에 입력
    func doSuffleAvengers<Element> (objArray: inout Array<Element>) {
        objArray = objArray.shuffled()
    }
    
    /// 입력된 영웅 어벤져스 해당 팀에 참가 메서드 ( CHero 인스턴스 생성 및 각 팀 배열에 append )
    /// - enumTeam: Int형 원시값을 가진 enum을 이용하여 팀 배분
    /// - strName: 생성될 영웅의 이름 매개변수로 받음
    /// - 입력된 영웅의 이름이 사전에 정의된 영웅 enum에 존재하는지 확인, guard m_arrNameOfAvengers.contains(strName) else
    /// - switch구문에 enumTeam을 조건으로하여 팀을 구분하고 따라 다른 성격의 영웅 인스턴스 생성
    /// - 옵셔널 바인딩을 통해 영웅 인스턴스의 nil여부를 확인 후 최종 배열에 할당, if let objHeroOptional: CHero = objHero
    func doJoinAvengers ( enumTeam: enumTeamOfAvengers, strName: String ) {
        var objHero: CHero?
        let iHeroIndex: Int = CAvengers.s_iMemberCount + 1
        //let iHeroIndex: Int = m_arrAllGroups[enumTeam.rawValue].count + 1
        
        guard m_arrNameOfAvengers.contains(strName) else {
            print("Unfortunately there is no such an Avenger")
            return
        }
        
        switch (enumTeam) {
        case .TEAM_IRON_MAN:
            objHero = CHeroIronManTeam(iHeroIndex, strName: strName)
        case .TEAM_CAPTAIN_AMERICA:
            objHero = CHeroCaptainTeam(iHeroIndex, strName: strName)
        }
        
        if let objHeroOptional: CHero = objHero {
            m_arrAllGroups[enumTeam.rawValue].append( objHeroOptional )
        } else {
            print("Unfortunately there is no such an Avenger belongs this team")
            return
        }
    }
    
    /// 존재하는 모든 팀들의 구성원들을 하나의 배열에 모아서 반환하는 메서드
    /// - 팀은 존재하지만 구성원이 아직 존재하지 않는 배열 필터링, objArrays.removeAll( ( objArray: [Element] ) -> Bool )
    /// - 만약에 구성원이 남아있는 팀이 하나이상 남아있지 않을 경우 에러 로그남긴 후 메서드종료, guard !objArrays.isEmpty else
    /// - 존재하는 팀의 개수만큼 각각 한명씩 결과배열에 append 됨, (0..<objArrays.count).forEach
    /// - 팀에 구성원이 남아있지 않은 팀은 루트배열에서 삭제, objArrays.removeAll { $0.isEmpty }
    /// - 입력된 모든 구성원들이 결과배열에 추가되면 결과배열을 반환하고 메서드 종료, return objResult
    func doMergeAvengers<Element> (_ objArrays: Array<Element>... ) -> Array<Element> {
        var objArrays = objArrays
        var objResult = Array<Element>()
        
        objArrays.removeAll(where: { ( objArray: [Element] ) -> Bool in
            return objArray.isEmpty
        } )
        
        guard !objArrays.isEmpty else {
            print("Badly there is no available group to merge")
            return objResult
        }
        
        while (!objArrays.isEmpty) {
            objArrays.removeAll { $0.isEmpty }
            
            // Last Result
            (0..<objArrays.count).forEach {
                if let objHero: Element = objArrays[$0].popLast() {
                    objResult.append(objHero)
                }
            }
            // Helped Reference
            //            (0..<objArrays.count).forEach {
            //                objResult.append(objArrays[$0].popLast()!)
            //            }
            // 2nd Attempt
            //            for iArrayIndex in 0..<objArrays.count {
            //                if let objHero: Element = objArrays[iArrayIndex].popLast() {
            //                    objResult.append(objHero)
            //                }
            //            }
            // 1st Attempt
            //            objArrays.forEach {
            //                var objArray: [Element] = $0
            //                if let objHero: Element = objArray.popLast() {
            //                    objResult.append(objHero)
            //                }
            //            }
        }
        
        return objResult
    }
}

/// 각 영웅 공통 클래스 선언
class CHero: ProtHeroable {
    // 영웅 이름
    let m_strNickName: String
    // 영웅 고유번호
    let m_iHeroIndex: Int
    
    /// 생성자 - 인스턴스 생성시 최초 진입 부분
    init (_ iHeroIndex: Int, strName: String) {
        m_strNickName = strName
        m_iHeroIndex = iHeroIndex
    }
    
    /// 모든 영웅 인스턴스들의 공통 인사 메서드
    func doGreet() {
        let closerToken: (Int) -> String = doChooseProperStringToken
        let strToken: String = closerToken(m_iHeroIndex)
        
        print("\(m_strNickName): I am the \(m_iHeroIndex)\(strToken) strongest hero throughout the world")
    }
}

/// 어벤져스내의 각 팀별 클래스
/// - 미완료: 현재 상속중인 CHero를 삭제
/// - 미완료: 현재 존재하는 "CHero[A-Za-z]Team" 클래스들이 CAvengers 상속 및 CAvengers 내부 구조 전면 수정 필요
/// - 미완료: 현재 CAvengers내에서 배열로 관리하고 있는 팀 구성을 각 팀별로 분산 ex) Avengers > Teams > Heros
/// - 미완료:  각 Hierarchy 구간 별로 인스턴스 생성 연결
class CHeroIronManTeam: CHero {
    // 익스텐션에 정의된 EasterEgg 메서드용 문자열 상수
    let m_strJustification: String
    
    /// 부모메서드로부터 재정의 된 생성자 - 인스턴스 생성시 동일한 매개변수들의 개수와 타입으로 호출시 최초 진입 부분
    override init (_ iHeroIndex: Int, strName: String) {
        m_strJustification = "Justice"
        super.init(iHeroIndex, strName: strName)
    }
    
    /// 생성자 - 인스턴스 생성시 동일한 매개변수들의 개수와 타입으로 호출시 최초 진입 부분
    /// -  익스텐션에 정의된 EasterEgg 메서드용 문자열 (strJustification) 원하는 문자로 초기화 가능토록 중복정의된 메서드
    init (iHeroIndex: Int, strName: String, strJustification: String = "Justice") {
        m_strJustification = strJustification
        super.init(iHeroIndex, strName: strName)
    }
    
    /// 부모메서드로부터 재정의 된 아이언맨팀 영웅들만의 고유 인사 메서드
    override func doGreet() {
        let strToken: String = doChooseProperStringToken(iHeroIndex: m_iHeroIndex)
        
        print("Hello \(m_strNickName), you are \(m_iHeroIndex)\(strToken).")
    }
}

class CHeroCaptainTeam: CHero {
    // 익스텐션에 정의된 EasterEgg 메서드용 불리언 상수
    let m_bIsThereGuilty: Bool
    
    /// 생성자 - 인스턴스 생성시 최초 진입 부분
    override init (_ iHeroIndex: Int, strName: String) {
        m_bIsThereGuilty = false
        super.init(iHeroIndex, strName: strName)
    }
    
    /// 부모메서드로부터 재정의 된 캡틴아메리카팀 영웅들만의 고유 인사 메서드
    override func doGreet() {
        print("Hi \(m_strNickName), you are \(m_iHeroIndex)\(doChooseProperStringToken(iHeroIndex: m_iHeroIndex)).")
    }
}

//--------------------------------------------------------------- 호출부
// 어벤져스 인스턴스 생성
let objAvengers: CAvengers = CAvengers()

//----- 퀴즈의 정답을 위한 실행부 -----
var objArrayForPrint: Array<CHero> = []
// 정해둔 팀으로 영웅 인스턴스 생성
for iMemberCount in 0 ..< objAvengers.m_arrNameOfAvengers.count {
    let iHeroIndex: Int = iMemberCount + 1
    
    switch (iHeroIndex) {
    case _ where iHeroIndex.bIsOddNum:
        objAvengers.doJoinAvengers(enumTeam: .TEAM_IRON_MAN, strName: objAvengers.m_arrNameOfAvengers[iMemberCount])
        break
    case 1 ... objAvengers.m_arrNameOfAvengers.count where iHeroIndex.bIsEvenNum:
        objAvengers.doJoinAvengers(enumTeam: .TEAM_CAPTAIN_AMERICA, strName: objAvengers.m_arrNameOfAvengers[iMemberCount])
        break
    default:
        print("The hero index must be merely below \(objAvengers.m_arrNameOfAvengers.count)")
        break
    }
}
// Alternative하게 인사를 출력하도록 두 팀의 멤버들을 번갈아가면서 프린트할 배열에 입력
objArrayForPrint = objAvengers.doMergeAvengers(
    objAvengers.m_arrAllGroups[enumTeamOfAvengers.TEAM_IRON_MAN.rawValue].reversed(),
    objAvengers.m_arrAllGroups[enumTeamOfAvengers.TEAM_CAPTAIN_AMERICA.rawValue].reversed()
)
// 퀴즈 정답 출력
for objHero in objArrayForPrint {
    objHero.doGreet()
}
//--------------------------------

// 존재하는 모든 팀별 영웅 인사
//for arrTeam in objAvengers.m_arrAllGroups {
//    arrTeam.forEach {
//        $0.doGreet()
//    }
//}
