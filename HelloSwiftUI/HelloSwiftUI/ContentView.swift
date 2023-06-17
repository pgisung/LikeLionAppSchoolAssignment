//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by JOHNNY_MAC_1 on 2023/06/13.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var name: String = "JohnnyPark"

    let speechSynth = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            TextField("Please feel free to fill", text: $name)
            
            Text("Hello \(name)")
            
            Button("Say Hello") {
                // 이곳은 버튼이 눌렸을 때 처리할 별도의 클로저니까
                // print 등등 그냥 함수 실행 내용 줄줄 써주면 된다
                let message: String = "Hello \(name)"
                
                let utterance = AVSpeechUtterance(string: message)
                speechSynth.speak(utterance)
            }
        }
        .font(.largeTitle)
        .padding()
    }
}

//struct ContentView: View {
//    // 1. wifiEnable은 @State라고 적어주어서
//    // 이 내용이 바뀌면 body가 새로 그려질거라고
//    // SwiftUI에 알려준다!
//
//    // 3. 밑에서 스위치를 건들면 wifiEnable 값도 바뀌니까
//    // 알아서 body 전체를 다시 그려서 보여주게 된다
//    // 단, 새롭게 바뀐 wifiEnable값에 맞춰서
//    @State var wifiEnable: Bool = false
//
//    var wifiStatusString: String {
//        get {
//            if wifiEnable {
//                return "On"
//            } else {
//                return "Off"
//            }
//        }
//    }
//
//    // 위 프로퍼티를 삼항연산자로 단순화할 수 있다
//    var wifiStatusStringToo: String {
//        wifiEnable ? "On" : "Off"
//    }
//
//    // 연산프로퍼티 대신 함수 만들어 써도 된다
//    func getWifiStatusString() -> String {
//        if wifiEnable {
//            return "On"
//        } else {
//            return "Off"
//        }
//    }
//
//    func getWifiStatusStringToo() -> String {
//        wifiEnable ? "On" : "Off"
//    }
//
//    var body: some View {
//        VStack {
//            Text("Wi-fi Status")
//
//            // 여기엔 스위치
//            // 2. Toggle 스위치는 이렇게 쓰면
//            // 프리뷰에서 보듯이 모양은 나오는데,
//            // 중요한건, wifiEnable 앞에 $를 붙여서
//            // Binding, 이제부터 스위치가 On/Off 되는 상태가
//            // 실제 wifiEnable 값을 바꾸도록 동기화 시킨다
//            Toggle(isOn: $wifiEnable) {
//                Text("Enable Wi-Fi")
//            }
//
//            // 스위치로 바꾼 현재 상태 보여주기
//            Text("\(wifiStatusString)")
//            Text("\(wifiStatusStringToo)")
//            Text("\(getWifiStatusString())")
//            Text("\(getWifiStatusStringToo())")
//        }
//        .font(.largeTitle)
//        .padding()
//    }
//}

//// View 프로토콜을 따르는 ContentView 구조체
//struct ContentView: View {
//    // View 프로토콜을 따르는 구조체 타입인 body 연산 프로퍼티 변수
//    var body: some View {
//        // VStack 안의 View들은 위 아래 순서로 쌓여간다
//        VStack {
//            Spacer()
//
//            // HStack 안의 View들은 왼쪽에서 오른쪽 순서로 쌓여간다
//            HStack {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//            .font(.largeTitle)
//
//            Spacer()
//
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//            Text("Hello, world!")
//                .font(.largeTitle)
//                .fontWeight(.regular)
//            Text("Hello, world!")
//            Text("Hello, world!")
//
//            // Stack같은 내부의 View들이 포함되는 경우엔
//            // 10개 넘게 포함될 수 없다
//            // 이럴 때는 Group을 활용해 그 숫자를 줄이는
//            // 효과로 해결할 수 있다
//            Group {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//
//            Spacer()
//        }
//        .padding()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
