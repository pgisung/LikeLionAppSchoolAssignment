//
//  ContentView.swift
//  SNL
//
//  Created by Jongwook Park on 2022/10/22.
//

import SwiftUI


class GameData: ObservableObject {
    var randomInt_1: Int = Int.random(in: 0..<10)
    var randomInt_2: Int = Int.random(in: 0..<10)
    var randomInt_3: Int = Int.random(in: 0..<10)
    var randomInt_4: Int = Int.random(in: 0..<10)
    
    func randomInt() {
        randomInt_1 = Int.random(in: 0..<10)
        randomInt_2 = Int.random(in: 0..<10)
        randomInt_3 = Int.random(in: 0..<10)
        randomInt_4 = Int.random(in: 0..<10)
    }
}

struct ContentView: View {
    
    @ObservedObject var gameData :GameData
    
    @State private var userInputValue_1: Int = 0
    @State private var userInputValue_2: Int = 0
    @State private var userInputValue_3: Int = 0
    @State private var userInputValue_4: Int = 0
    
    // 결과를 보여줄 문자열을 만들어주는 연산 프로퍼티
    var resultCount: Int {
        get {
            var correctCount: Int = 0
            
            if gameData.randomInt_1 == userInputValue_1 {
                correctCount += 1
            }
            
            if gameData.randomInt_2 == userInputValue_2 {
                correctCount += 1
            }
            
            if gameData.randomInt_3 == userInputValue_3 {
                correctCount += 1
            }
            
            if gameData.randomInt_4 == userInputValue_4 {
                correctCount += 1
            }
            
            return correctCount
        }
    }
    
    var body: some View {
        VStack {
            // 제어문은 SwiftUI body 선언에 (제한적으로) 들어갈 수는 있다
            switch resultCount{
            case 0:
                VStack {
                    AsyncImage(url: URL(string: "https://mblogthumb-phinf.pstatic.net/MjAxODA2MDNfMjI2/MDAxNTI3OTY0ODU1Mjc0.raxU8TtBG-t4x6HG49CmQZj9egXIKj-QZOzAvIemazwg.hhpMu2oOBAXEngQ8zgjSdIBxiZWmm_ExuTlq81KX1dMg.JPEG.190208/KakaoTalk_20180514_015925630.jpg?type=w800")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("겨우 하나도 못 맞췄습니다")
                        .font(.largeTitle)
                        .padding()
                }
            case 1:
                VStack {
                    AsyncImage(url: URL(string: "https://jjalbang.today/jjv1sy.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("한 개, 겨우 좀 맞췄습니다")
                        .font(.largeTitle)
                    .padding()
                    
                }
            case 2:
                VStack {
                    AsyncImage(url: URL(string: "https://cdn.discordapp.com/attachments/1022387257317007360/1033300530556051556/IMG_1467.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("두 개, 좀 하시네요")
                        .font(.largeTitle)
                        .padding()
                }
            case 3:
                VStack {
                    AsyncImage(url: URL(string: "https://blog.kakaocdn.net/dn/cyZQNN/btrb7akqNfn/pG9T3TwbV1VntbGORx8JW0/img.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("거의 다 왔습니다. 세 개")
                        .font(.largeTitle)
                        .padding()
                }
            case 4:
                VStack {
                    AsyncImage(url: URL(string: "https://cdn.deupress.or.kr/news/photo/202104/6158_5619_5514.png")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("다 맞췄습니다")
                        .font(.largeTitle)
                        .padding()
                }
            default:
                VStack {
                    AsyncImage(url: URL(string: "https://mblogthumb-phinf.pstatic.net/MjAxODA2MDNfMjI2/MDAxNTI3OTY0ODU1Mjc0.raxU8TtBG-t4x6HG49CmQZj9egXIKj-QZOzAvIemazwg.hhpMu2oOBAXEngQ8zgjSdIBxiZWmm_ExuTlq81KX1dMg.JPEG.190208/KakaoTalk_20180514_015925630.jpg?type=w800")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("몇 개 맞췄는지 통 모르겠네요")
                        .font(.largeTitle)
                        .padding()
                }
            }
            
            Text("현재 선택은 \(userInputValue_1)\(userInputValue_2)\(userInputValue_3)\(userInputValue_4)입니다")
            
            VStack {
                Picker(selection: $userInputValue_1, label: Text("숫자를 선택하세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                
                
                Picker(selection: $userInputValue_2, label: Text("숫자를 선택하세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                
                
                Picker(selection: $userInputValue_3, label: Text("숫자를 선택하세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                
                
                Picker(selection: $userInputValue_4, label: Text("숫자를 선택하세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            
            Button("새로운 게임") {
                gameData.randomInt()
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameData: GameData())
    }
}
