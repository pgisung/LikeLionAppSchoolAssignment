//
//  ContentView.swift
//  GreetingMembersSwiftUI
//
//  Created by JOHNNY_MAC_1 on 2023/06/13.
//

import SwiftUI
import AVFoundation

// ------------------------ 함께해요 2번 강사님과 ------------------------
//struct ContentView: View {
//
//    @State var selectedIndex: Int = 0
//    @State var result: String = "(result)"
//
//    let speechSynth: AVSpeechSynthesizer = AVSpeechSynthesizer()
//
//    var body: some View {
//        VStack {
//            Text("#Table")
//                .font(.headline)
//                .padding()
//
//            HStack {
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(1)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("1")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(2)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("2")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(3)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("3")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(4)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("4")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(5)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("5")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(6)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("6")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(7)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("7")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(8)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("8")
//                            .font(.largeTitle)
//                    }
//
//                    Spacer()
//                }
//                Group {
//                    Button {
//                        // action 클로저 담길 영역
//                        updateSelectedIndex(9)
//                    } label: {
//                        // label View 코드가 담길 영역
//                        Text("9")
//                            .font(.largeTitle)
//                    }
//                }
//            }
//            .padding()
//
//            if selectedIndex > 0 {
//                Text("Table for \(selectedIndex)")
//                    .font(.largeTitle)
//                    .padding()
//
//                Text("\(result)")
//                    .font(.largeTitle)
//
//                HStack {
//                    Button {
//                        let message = "\(result)"
//
//                        let utterance = AVSpeechUtterance(string: message)
//                        speechSynth.speak(utterance)
//                    } label: {
//                        Text("Say it")
//                            .font(.largeTitle)
//                            .padding()
//                    }
//                    Button {
//                        speechSynth.stopSpeaking(at: .immediate)
//                    } label: {
//                        Text("Stop it")
//                            .font(.largeTitle)
//                            .padding()
//                    }
//                }
//            }
//
//            Spacer()
//        }
//    }
//
//    func updateSelectedIndex(_ index: Int) {
//        selectedIndex = index
//        print("\(selectedIndex)")
//
//        result = """
//                \(selectedIndex) x 1 = \(selectedIndex * 1)
//                \(selectedIndex) x 2 = \(selectedIndex * 2)
//                \(selectedIndex) x 3 = \(selectedIndex * 3)
//                \(selectedIndex) x 4 = \(selectedIndex * 4)
//                \(selectedIndex) x 5 = \(selectedIndex * 5)
//                \(selectedIndex) x 6 = \(selectedIndex * 6)
//                \(selectedIndex) x 7 = \(selectedIndex * 7)
//                \(selectedIndex) x 8 = \(selectedIndex * 8)
//                \(selectedIndex) x 9 = \(selectedIndex * 9)
//                """
//
//        // 위 방법 말고 for-in 반복문으로 만드는 방법은?
//        result = ""
//
//        for indexTemp in 1...9 {
//            result = result + "\(selectedIndex) \u{D7} \(indexTemp) = \(selectedIndex * indexTemp)\n"
//        }
//    }
//}


// ------------------------ 함께해요 1번 강사님과 ------------------------
//
//// 이렇게 별명을 관리하는 간단한 데이터 구조
//// 1. 이름들과 별명들을 각각 배열로 만든다
////let names: [String] = ["홍길동", "고길동", "마이콜"]
////let nicknames: [String] = ["호형호제", "종로로갈까요", "유어콜"]
//
//// 2. 딕셔너리로 만든다
////let friends: [String: String] = [
////    "홍길동":"호형호제",
////    "고길동":"종로스타",
////    "마이콜":"유어콜"
////]
//
//// 3. 딕셔너리의 배열로 만들어볼까?
//let friends: [[String: String]] = [
//        [
//            "name":"홍길동",
//            "nickname":"호형호제"
//        ],
//        [
//            "name":"고길동",
//            "nickname":"종로스타",
//        ],
//        [
//            "name":"마이콜",
//            "nickname":"유어콜",
//        ],
//        [
//            "name":"희동이",
//            "nickname":"지금쯤 군대",
//        ],
//        [
//            "name":"또치",
//            "nickname":"맛있는 또치",
//        ],
//        [
//            "name":"도우너",
//            "nickname":"깐따삐아",
//        ],
//]
//
//struct ContentView: View {
//
//    // 만약에 View 내부의 어딘가든
//    // 밖의 func 코드든
//    // 어디에든 이 값을 바꾸면
//    // body를 새로 그려주도록 할 필요가 있다
//    // 그러려면 @State를 써보자
////    @State var name: String = ""
////    @State var nickname: String = "별명"
//
//    // SwiftUI의 View는 init을 따로 만들지 말아달라고
//    // 공식 자료들에서 언급한다
//    //    init() {
//    //        name= = ""
//    //    }
//
//    let speechSynth: AVSpeechSynthesizer = AVSpeechSynthesizer()
//
//    // 우리는 이제 몇 번째 대상을 선택했는지만 기억하려고 합니다
//    @State var selectedIndex: Int = -1
//
//    // 몇 번째가 선택되었는지에 맞춰서 이름도 확인해주고
//    var name: String {
//        get {
//            return getFriendName(selectedIndex)
//        }
//    }
//
//    // 별명도 확인해주면
//    var nickname: String {
//        getFriendNickName(selectedIndex)
//    }
//
//    var body: some View {
//        VStack {
//
//            // 어? body 안에 if가 되네?
//            if selectedIndex < 0 {
//                Text("이름을 선택하세요")
//            } else {
//                // 확인된 이름과 별명을 화면에 보여주면 끝!
//                Text("Hello \(name) a.k.a \(nickname)")
//            }
//
//            // Button을 생성하는 init 메소드는
//            // 두 action과 label이라는 두 매개변수를
//            // 각각 클로저로 받을 수 있기 때문에
//            // 아래와 같이 간략화된 모양으로 써도 된다
//            // 이런 것을 "후행 클로저"라고 부른다
//            Button {
//                // action: () -> Void
//                selectedIndex = 0
//                sayHello(selectedIndex)
//            } label: {
//                // label
//                // 이렇게 아무 매개 변수 없이
//                // view의 일종인 Text를 반환하는
//                // 클로저로 label 매개변수가
//                // 채워지면 되는 것이다
//                return Text("\(getFriendName(0))")
//                    .padding()
//            }
//
//            Button {
//                // action
//                selectedIndex = 1
//                sayHello(selectedIndex)
//            } label: {
//                // label
//                Text("\(getFriendName(1))")
//                    .padding()
//            }
//
//            Button {
//                // action
//                selectedIndex = 2
//                sayHello(selectedIndex)
//            } label: {
//                // label
//                Text("\(getFriendName(2))")
//                    .padding()
//            }
//
//            Button {
//                // action
//                selectedIndex = 3
//                sayHello(selectedIndex)
//            } label: {
//                // label
//                Text("\(getFriendName(3))")
//                    .padding()
//            }
//
//            Button {
//                // action
//                selectedIndex = 4
//                sayHello(selectedIndex)
//            } label: {
//                // label
//                Text("\(getFriendName(4))")
//                    .padding()
//            }
//
//            Button {
//                // action
//                selectedIndex = 5
//                sayHello(selectedIndex)
//            } label: {
//                // label
//                Text("\(getFriendName(5))")
//                    .padding()
//            }
//
//            // TMI
//            // $표시는 Binding과 관련된 내용으로
//            // 나중에 더 자세히 배울 예정!
//            // 일단 $는 꼭 "$ 써주세요" 라고 할 때만
//            // 써주면 된다고 생각합시다!
//            // - 앗! 키보드가 올라오면 알아서 적절하게 되네?
////            TextField("Input your name", text: $nickname)
//        }
//        .font(.largeTitle)
//        .padding()
//    }
//
//    func getFriendName(_ index: Int) -> String {
//        guard index >= 0 else {
//            return "(name)"
//        }
//
//        let friend = friends[index]
//
//        if let name = friend["name"] {
//            return name
//        }
//
//        // 위코드는 이렇게 한 줄로 줄일 수도 있다
//        // name = friend["name"] ?? "(name)"
//
//        return "(name)"
//    }
//
//    func getFriendNickName(_ index: Int) -> String {
//        guard index >= 0 else {
//            return "(name)"
//        }
//
//        let friend = friends[index]
//
//        return friend["nickname"] ?? "(nickname)"
//    }
//
//    func sayHello(_ index: Int) {
//        let name = getFriendName(index)
//        let nickname = getFriendNickName(index)
//        let message = "\(nickname)이라고 불리는 \(name)님 어서오고"
//        let utterance = AVSpeechUtterance(string: message)
//        speechSynth.speak(utterance)
//    }
//}

// ------------------------ 함께해요 2번 ------------------------
//struct ContentView: View {
//    let speechSynth: AVSpeechSynthesizer = AVSpeechSynthesizer()
//    @State var m_iGradeOfGugudan: Int = 0
//    @State var m_strGugudanMessage: String = ""
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Text(m_strGugudanMessage)
//            Spacer()
//            HStack {
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 1
//                    gugudan()
//                }, label:{
//                    Text("1")
//                })
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 2
//                    gugudan()
//                }, label:{
//                    Text("2")
//                })
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 3
//                    gugudan()
//                }, label:{
//                    Text("3")
//                })
//                Spacer()
//            }
//            Spacer()
//            HStack {
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 4
//                    gugudan()
//                }, label:{
//                    Text("4")
//                })
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 5
//                    gugudan()
//                }, label:{
//                    Text("5")
//                })
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 6
//                    gugudan()
//                }, label:{
//                    Text("6")
//                })
//                Spacer()
//            }
//            Spacer()
//            HStack {
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 7
//                    gugudan()
//                }, label:{
//                    Text("7")
//                })
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 8
//                    gugudan()
//                }, label:{
//                    Text("8")
//                })
//                Spacer()
//                Button(action: {
//                    m_iGradeOfGugudan = 9
//                    gugudan()
//                }, label:{
//                    Text("9")
//                })
//                Spacer()
//            }
//            Spacer()
//            HStack {
//                Spacer()
//                Button(action: {
//                    speaking()
//                }, label:{
//                    Text("Speak")
//                })
//                Spacer()
//                Button(action: {
//                    stopSpeaking()
//                }, label:{
//                    Text("Stop")
//                })
//                Spacer()
//            }
//        }
//        .padding()
//    }
//
//    func speaking() {
//        let objSpeechUtterance = AVSpeechUtterance(string: m_strGugudanMessage)
//        speechSynth.speak(objSpeechUtterance)
//    }
//
//    func stopSpeaking() {
//        if speechSynth.isSpeaking {
//            speechSynth.stopSpeaking(at: AVSpeechBoundary.immediate)
//        }
//    }
//
//    func gugudan() {
//        guard m_iGradeOfGugudan != 0 else {
//            return
//        }
//
//        m_strGugudanMessage = ""
//
//        for iLoopCount in 1...9 {
//            m_strGugudanMessage += "\(m_iGradeOfGugudan) * \(iLoopCount) = \(m_iGradeOfGugudan * iLoopCount)\n"
//        }
//    }
//}

// ------------------------ 함께해요 1번 ------------------------
struct ContentView: View {
    let speechSynth: AVSpeechSynthesizer = AVSpeechSynthesizer()
    @State var m_strGreetingMessage: String = "GreetingMessage"
    let m_objDictionary: [String: String] = [
        "원강묵": "무커",
        "박지성": "조니",
        "정석호": "덤보",
        "박정선": "개발마스터",
        "김건섭": "건빵",
        "안효명": "ahn",
        "한아리": "아리랑",
        "박재민": "재민빡"
    ]

    var body: some View {
        VStack {
            Spacer()
            Text(m_strGreetingMessage)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 원강묵님! 별명은 \(m_objDictionary["원강묵"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("원강묵")
                })
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 박지성님! 별명은 \(m_objDictionary["박지성"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("박지성")
                })
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 정석호님! 별명은 \(m_objDictionary["정석호"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("정석호")
                })
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 박정선님! 별명은 \(m_objDictionary["박정선"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("박정선")
                })
                Spacer()
                Button(action: {

                }, label:{
                    Text("Empty")
                })
                .hidden()
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 김건섭님! 별명은 \(m_objDictionary["김건섭"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("김건섭")
                })
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 안효명님! 별명은 \(m_objDictionary["안효명"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("안효명")
                })
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 한아리님! 별명은 \(m_objDictionary["한아리"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("한아리")
                })
                Spacer()
                Button(action: {
                    m_strGreetingMessage = "안녕하세요 박재민님! 별명은 \(m_objDictionary["박재민"] ?? "이름없음")입니다."
                    speaking()
                }, label:{
                    Text("박재민")
                })
                Spacer()
            }
            Spacer()
        }
        .padding()
    }

    func speaking() {
        let objSpeechUtterance = AVSpeechUtterance(string: m_strGreetingMessage)
        speechSynth.speak(objSpeechUtterance)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//@IBAction func actionGreeting(_ sender: UIButton) {
//    let strName: String = sender.titleLabel?.text ?? "아무개"
//    let strGreeting: String = "안녕하세요 \(strName)님! 별명은 \(m_objDictionary[strName] ?? "아무개별명")입니다."
//    let objSpeechUtterance = AVSpeechUtterance(string: strGreeting)
//
//    lblGreeting.text = strGreeting
//    objSpeechSynthesizer?.speak(objSpeechUtterance)
//}
