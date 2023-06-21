//
//  ViewController.swift
//  NumberOXQuizKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operator {
        case PLUS
        case MINUS
        case MUL
        case DIV
        case MOD
    }
    var oper: Operator = .MUL
    
    let maxCount: Int = 10
    var count: Int = 0
    
    var numCorrect: Int = 0
    var numIncorrect: Int = 0
    var userAnswer: Bool = false
    
    let range = 1...4
    var operandA: Int = 0
    var operandB: Int = 0
    var randomAnswer: Int = 0
    var quiz: String = ""
    
    let objAVSpeechSynthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var lblNotice: UILabel!
    @IBOutlet weak var lblAdditionalNotice: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblQuiz: UILabel!
    
    // 숨기기용
    var arrBtn: [UIButton] = []
    @IBOutlet weak var btnO: UIButton!
    @IBOutlet weak var btnX: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiple: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    @IBOutlet weak var btnModuler: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadInitializer()
    }
    
    func loadInitializer() {
        count = maxCount
        operandA = Int.random(in: range)
        operandB = Int.random(in: range)
        randomAnswer = Int.random(in: range) * Int.random(in: range)
        lblNotice.text = "현재 \(count)개의 문제를 푸실수 있습니다"
        lblAdditionalNotice.text = "계속 진행하고 싶으시면 결제를 해주세요 ^.^"
        lblMessage.text = "정답 : \(numCorrect)\t오답 : \(numIncorrect)"
        quiz = "\(operandA) \u{D7} \(operandB) = \(randomAnswer)"
        lblQuiz.text = quiz
        // 숨기기용
        arrBtn.append(btnO)
        arrBtn.append(btnX)
        arrBtn.append(btnPlus)
        arrBtn.append(btnMinus)
        arrBtn.append(btnMultiple)
        arrBtn.append(btnDivision)
        arrBtn.append(btnModuler)
    }
    
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
    
    // 숨길때 true 다시 보일때 false
    func hideButtons(_ toggle: Bool) {
        for btn in arrBtn {
            btn.isHidden = toggle
        }
    }
    
    func updateResult() {
        if count > 0 {
            count -= 1
        } else {
            count = maxCount
            return
        }
        lblNotice.text = "현재 \(count)개의 문제를 푸실수 있습니다"
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
        if count < 1 {
            hideButtons(true)
        }
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
    
    @IBAction func actionReset(_ sender: UIButton) {
        count = maxCount
        hideButtons(false)
        lblNotice.text = "현재 \(count)개의 문제를 푸실수 있습니다"
        numCorrect = 0
        numIncorrect = 0
        lblMessage.text = "정답 : \(numCorrect)\t오답 : \(numIncorrect)"
    }
    
    @IBAction func actionUserAnswer(_ sender: UIButton) {
        if sender.titleLabel?.text == "O" {
            userAnswer = true
        } else {
            userAnswer = false
        }
        updateResult()
        lblMessage.text = "정답 : \(numCorrect)\t오답 : \(numIncorrect)"
        funcInitialize(oper)
        lblQuiz.text = quiz
    }
    
    @IBAction func actionChangeOperator(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "+":
            oper = .PLUS
            break
        case "-":
            oper = .MINUS
            break
        case "*":
            oper = .MUL
            break
        case "/":
            oper = .DIV
            break
        case "%":
            oper = .MOD
            break
        default:
            oper = .MUL
            break
        }
        funcInitialize(oper)
        lblQuiz.text = quiz
    }
}

