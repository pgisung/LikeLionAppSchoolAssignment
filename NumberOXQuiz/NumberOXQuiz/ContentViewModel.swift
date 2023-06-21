//
//  ContentViewModel.swift
//  NumberOXQuiz
//
//  Created by JOHNNY_MAC_1 on 2023/06/20.
//

import Foundation

enum Operator {
    case PLUS
    case MINUS
    case MUL
    case DIV
    case MOD
}

let maxCount: Int = 10
let range = 1...4
var operandA: Int = Int.random(in: range)
var operandB: Int = Int.random(in: range)
var randomAnswer: Int = Int.random(in: range) * Int.random(in: range)

// O버튼 / X버튼 -> :맞았는지 틀렸는지 카운트(어딘가에서 카운트도 측정할거고/ 메세지를 출력을해야된다Text) /
// :다음문제 가야된다 (연산을 다시 실행하고, 피연산자2개도 갱신, 진짜결과, 출력용가짜결과 / 연산식 출력변경)
// :+말하기

var oper: Operator = .MUL

func funcOperation(_ command: Operator) -> Int {
    var iResult: Int = 0
    
    switch command {
    case .PLUS:
        iResult = operandA + operandB
    case .MINUS:
        iResult = operandA - operandB
    case .MUL:
        iResult = operandA * operandB
    case .DIV:
//        guard operandB != 0 else {
//            iResult = 0
//            break
//        }
        
        iResult = operandA / operandB
    case .MOD:
//        guard operandB != 0 else {
//            iResult = 0
//            break
//        }
        
        iResult = operandA % operandB
    }
    
    return iResult
}

// 실제 결과를 비교한다
func judgeAnswer() -> Bool {
    var bReturn = false
    
    if randomAnswer == funcOperation(oper) {
        bReturn = true
    } else {
        bReturn = false
    }
    
    return bReturn
}

// 유저 결과와 실제 결과 비교된 정답유무를 비교한다
func judgeUserAction(_ userAnswer: Bool) -> Bool {
    userAnswer == judgeAnswer()
}
