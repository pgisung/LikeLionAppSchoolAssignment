//
//  ContentView.swift
//  AnswerTheQuestion
//
//  Created by 박범수 on 2023/06/21.
//
import SwiftUI
import AVFoundation

enum Answer: String {
    case qusetion1이재승 = "2의 제곱"
    case qusetion2박범수 = "Swift"
    case qusetion3안지영 = "윤봉길"
    case qusetion4선아라 = "동물원에서의 나"
    case qusetion5이재승 = "피카츄"
    case qusetion6송도희 = "8"
    case qusetion7송도희 = "커피맛"
    case qusetion8안지영 = "르세라핌 - Antifragile"
    case qusetion9안지영 = "에픽하이 - 비오는 날 듣기 좋은 노래"
    case qusetion10송도희 = "닐 스미스"
}

struct Question {
    let question: String
    let correctAnswer: Answer
    let Answers: [String]
}
struct ContentView: View {
    @State var questions: [Question] = [
        Question(question: "1번 문제 2의 자승과 같은 것으로 올바른 것은?" ,
                 correctAnswer: .qusetion1이재승,
                 Answers: ["2의 10승", "이의 재승", "이재승", "2의 제곱"]),
        
        Question(question: "2번 문제 SwiftUI 앱 개발에 사용되는 언어는?",
                 correctAnswer: .qusetion2박범수,
                 Answers: ["Swift", "Java", "C++", "kotlin"]),
        
        Question(question: "3번 문제 다음 중 우리나라에 실제로 존재하지 않는 도로명은 무엇일까요?",
                 correctAnswer: .qusetion3안지영,
                 Answers: ["귀성길", "먹방길", "윤봉길", "댕댕이길"]),
        
        Question(question: "4번 문제 세계 최대의 동영상 공유 플랫폼 유튜브에서 세계 최초로 업로드된 동영상의 제목은?",
                 correctAnswer: .qusetion4선아라,
                 Answers: ["떡볶이 먹방", "그가 술을 마신 이유", "동물원에서의 나", "재미있는 순간들"]),
        
        Question(question: "5번 문제 작년 미국의 시사 주간지 타임지에서는 1999년에 베스트 인물로 인기 가수 리키 마틴과 애니메이션 포켓몬의 주인공 “이것”을 선정했습니다. ‘이것’의 이름은?",
                 correctAnswer: .qusetion5이재승,
                 Answers: ["번개맨", "피카츄", "꼬부기", "펭수"]),
        
        Question(question: "6번 문제 도희님이 키우는 고양이의 몸무게는?",
                 correctAnswer: .qusetion6송도희,
                 Answers: ["6", "7", "8", "9"]),
        
        Question(question: "7번 문제 다음중 프링글스에 없는 맛은?",
                 correctAnswer: .qusetion7송도희,
                 Answers: ["콜라맛", "와사비맛", "김치맛", "커피맛"]),
        
        Question(question: "8번 문제 다음중 걸그룹의 데뷔곡으로 틀린 것은?",
                 correctAnswer: .qusetion8안지영,
                 Answers: ["아이브 - eleven", "뉴진스 - attetion", "르세라핌 - Antifragile", "(여자)아이들 - latata"]),
        
        Question(question: "9번 문제 6/20 디스코드에서 나온 노래 중 신청곡이 아닌것은?",
                 correctAnswer: .qusetion9안지영, Answers: ["자두 - 김밥", "배치기 - 또래요", "최유리 -술", "에픽하이 - 비오는 날 듣기 좋은 노래"]),
        
        Question(question: "10번 문제다음중 교재 저자의 이름으로 알맞은 것은?",
                 correctAnswer: .qusetion10송도희,
                 Answers: ["닐 스미스", "닐 캐서디" ,"네드 팍", "샘 스미스"])
    ]
    
    let Voice = AVSpeechSynthesizer()
    
    @State var currentQuetion = 0
    @State var selectedAnswer: Int = 0
    
    @State var changedTrueorNot : [Bool] = [false, false , false ,false]
    @State var count:Int = 0
    @State var wrongCount = 0
    
    var body: some View {
        VStack {
            
            Text(questions[currentQuetion].question)
                .font(.largeTitle)
                .padding()
            
            Button(action:{
                selectedAnswer = 0
                speech(name: questions[currentQuetion].question)
                changedTrueorNot[selectedAnswer] = true
                rightOrleft()
                countMiss()
            }
            ) {
                Text(questions[currentQuetion].Answers[0])
                    .padding()
                    .foregroundColor(.white)
                    .background(changedTrueorNot[selectedAnswer] ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            
            Button(action: {
                selectedAnswer = 1
                speech(name: questions[currentQuetion].question)
                changedTrueorNot[selectedAnswer] = true
                rightOrleft()
                countMiss()
            }
            ) {
                Text(questions[currentQuetion].Answers[1])
                    .padding()
                    .foregroundColor(.white)
                    .background(changedTrueorNot[selectedAnswer] ? Color.blue : Color.gray)
                    .cornerRadius(10)
                
            }
            
            Button(action: {
                selectedAnswer = 2
                speech(name: questions[currentQuetion].question)
                changedTrueorNot[selectedAnswer] = true
                rightOrleft()
                countMiss()
            }) {
                Text(questions[currentQuetion].Answers[2])
                    .padding()
                    .foregroundColor(.white)
                    .background(changedTrueorNot[selectedAnswer] ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            
            Button(action: {
                selectedAnswer = 3
                speech(name: questions[currentQuetion].question)
                changedTrueorNot[selectedAnswer] = true
                rightOrleft()
                countMiss()
            }
            ) {
                Text(questions[currentQuetion].Answers[3])
                    .padding()
                    .foregroundColor(.white)
                    .background(changedTrueorNot[selectedAnswer] ? Color.blue : Color.gray)
                    .cornerRadius(10)
            }
            Text("맞은 갯수는 \(count)입니다")
            Text("틀린 갯수는 \(wrongCount)입니다")
        }
        .padding()
    }
    
    func rightOrleft() {
            
            for index in 0..<changedTrueorNot.count {
                changedTrueorNot[index] = false
            }
            currentQuetion += 1
        }
    
    func countMiss(){
        if questions[currentQuetion].Answers[selectedAnswer] != questions[currentQuetion].correctAnswer.rawValue {
            wrongCount += 1
        } else {
            count += 1
            wrongCount = 0
        }
        
        if wrongCount == 3 {
            currentQuetion = 0
        }
    }
    
    func speech(name:String) {
//        let utterence = AVSpeechUtterance(string: name)
//        Voice.speak(utterence)
    }
    
    
}//



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


