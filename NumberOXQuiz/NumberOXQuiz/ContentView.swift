//
//  ContentView.swift
//  NumberOXQuiz
//
//  Created by JOHNNY_MAC_1 on 2023/06/20.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var count: Int = maxCount
    @State var numCorrect: Int = 0
    @State var numIncorrect: Int = 0
    @State var message: String = "정답 : 0\t오답 : 0"
    @State var userAnswer: Bool = false
    @State var quiz: String = "\(operandA) \u{D7} \(operandB) = \(randomAnswer)"
    let objAVSpeechSynthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        VStack {
            Text("현재 \(count)개의 문제를 푸실수 있습니다")
            Text("계속 진행하고 싶으시면 결제를 해주세요 ^.^")
            Spacer()
            HStack {
                Spacer()
                Text("\(message)")
                    .font(.largeTitle)
                Spacer()
                Button(action: {
                    resetResult()
                }, label: {
                    Text("Reset")
                })
                .font(.largeTitle)
                Spacer()
            }
            Spacer()
            Text("\(quiz)")
                .font(.largeTitle)
            Spacer()
            if count > 0 {
                HStack {
                    Spacer()
                    Button(action: {
                        userAnswer = true
                        updateResult()
                        funcInitialize(oper)
                    }, label: {
                        Text("O")
                    })
                    .font(.largeTitle)
                    Spacer()
                    Button(action: {
                        userAnswer = false
                        updateResult()
                        funcInitialize(oper)
                    }, label: {
                        Text("X")
                    })
                    .font(.largeTitle)
                    Spacer()
                }
            }
            Spacer()
            if count > 0 {
                Group {
                    HStack {
                        Button(action: {
                            oper = .PLUS
                            funcInitialize(oper)
                        }, label: {
                            Text("+")
                        })
                        .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            oper = .MINUS
                            funcInitialize(oper)
                        }, label: {
                            Text("-")
                        })
                        .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            oper = .MUL
                            funcInitialize(oper)
                        }, label: {
                            Text("\u{D7}")
                        })
                        .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            oper = .DIV
                            funcInitialize(oper)
                        }, label: {
                            Text("\u{F7}")
                        })
                        .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            oper = .MOD
                            funcInitialize(oper)
                        }, label: {
                            Text("\u{25}")
                        })
                        .font(.largeTitle)
                    }
                }
                Spacer()
            }
        }
        .padding()
    }

    func updateResult() {
        if count > 0 {
            count -= 1
        } else {
            count = maxCount
        }
        // 사용자 정답 유무 확인 위치
        if judgeUserAction(userAnswer){
            numCorrect += 1
            let strSpeak: String = "리얼 천재만재아닙니까?"
            let objAVSpeechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: strSpeak)
            objAVSpeechSynthesizer.speak(objAVSpeechUtterance)
        } else {
            numIncorrect += 1
            let strSpeak: String = "진심이세요?"
            let objAVSpeechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: strSpeak)
            objAVSpeechSynthesizer.speak(objAVSpeechUtterance)
        }
        message = "정답 : \(numCorrect)\t오답 : \(numIncorrect)"
    }

    func resetResult() {
        count = maxCount
        numCorrect = 0
        numIncorrect = 0
        message = "정답 : \(numCorrect)\t오답 : \(numIncorrect)"
    }
    
    func funcInitialize(_ command: Operator) {
        let numA: Int = Int.random(in: range)
        let numB: Int = Int.random(in: range)
        operandA = Int.random(in: range)
        operandB = Int.random(in: range)
        
        switch command {
        case .PLUS:
            randomAnswer = numA + numB
            quiz = "\(operandA) + \(operandB) = \(randomAnswer)"
        case .MINUS:
            randomAnswer = numA - numB
            quiz = "\(operandA) - \(operandB) = \(randomAnswer)"
        case .MUL:
            randomAnswer = numA * numB
            quiz = "\(operandA) \u{D7} \(operandB) = \(randomAnswer)"
        case .DIV:
    //        guard numB != 0 && operandB != 0 else {
    //
    //            break
    //        }
            
            randomAnswer = numA / numB
            quiz = "\(operandA) \u{F7} \(operandB) = \(randomAnswer)"
        case .MOD:
    //        guard numB != 0 && operandB != 0 else {
    //
    //            break
    //        }
            
            randomAnswer = numA % numB
            quiz = "\(operandA) \u{25} \(operandB) = \(randomAnswer)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
