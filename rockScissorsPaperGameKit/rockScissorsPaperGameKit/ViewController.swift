//
//  ViewController.swift
//  rockScissorsPaperGameKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/26.
//

import UIKit

enum Result: String {
    case WIN = "win"
    case DRAW = "draw"
    case LOSE = "lose"
}

enum RSP: Int {
    case SCISSORS = -1
    case ROCK = 0
    case PAPER = 1
}

class ViewController: UIViewController {
    // 유저 answer 프로퍼티
    var userAnswer: RSP = .ROCK
    // PC answer 프로퍼티
    var AIAnswer: Int = 0
    var gameResult: Result = .WIN
    var countWin: Int = 0
    var countDraw: Int = 0
    var countLose: Int = 0
    
    // 아웃렛 변수
    @IBOutlet weak var lblAI: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblAI.text = "Choose your answer"
        lblResult.text = "You \(gameResult.rawValue)! [Win: 0 Draw: 0 Lose: 0]"
        AIAnswer = Int.random(in: -1...1)
    }
    
    func judgeResult() {
        if AIAnswer == RSP.ROCK.rawValue {
            if userAnswer == RSP.ROCK {
                gameResult = .DRAW
            } else if userAnswer == RSP.SCISSORS {
                gameResult = .WIN
            } else {
                gameResult = .LOSE
            }
        } else if AIAnswer == RSP.SCISSORS.rawValue {
            if userAnswer == RSP.ROCK {
                gameResult = .WIN
            } else if userAnswer == RSP.SCISSORS {
                gameResult = .DRAW
            } else {
                gameResult = .LOSE
            }
        } else {
            if userAnswer == RSP.ROCK {
                gameResult = .LOSE
            } else if userAnswer == RSP.SCISSORS {
                gameResult = .WIN
            } else {
                gameResult = .DRAW
            }
        }
        
        if gameResult == .WIN {
            countWin += 1
        } else if gameResult == .LOSE {
            countLose += 1
        } else {
            countDraw += 1
        }
    }
    
    func getString (_ chosenCase :RSP) -> String {
        if chosenCase == .ROCK {
            return "ROCK"
        } else if chosenCase == .SCISSORS {
            return "SCISSORS"
        } else {
            return "PAPER"
        }
    }
    
    func playGame(strUserAnswer: String) {
        let AIAnswerStrToken = getString(RSP(rawValue: AIAnswer) ?? .ROCK)
        lblAI.text = "\(AIAnswerStrToken)"
        
        // 유저 선택
        if strUserAnswer == String(getString(.ROCK)) {
            userAnswer = .ROCK
        } else if strUserAnswer == String(getString(.SCISSORS)) {
            userAnswer = .SCISSORS
        } else {
            userAnswer = .PAPER
        }
        
        judgeResult()
        
        lblResult.text = "You \(gameResult.rawValue)! [Win: \(countWin) Draw: \(countDraw) Lose: \(countLose)]"
    }
    
    // 액션
    @IBAction func actionPressUserAnswer(_ sender: UIButton) {
        playGame(strUserAnswer: sender.titleLabel?.text ?? "ROCK")
    }
    
    @IBAction func actionNextGame(_ sender: UIButton) {
        lblAI.text = "Choose your answer"
        AIAnswer = Int.random(in: -1...1)
    }
    
    @IBAction func actionReset(_ sender: UIButton) {
        countWin = 0
        countDraw = 0
        countLose = 0
        gameResult = .WIN
        lblResult.text = "You \(gameResult.rawValue)! [Win: \(countWin) Draw: \(countDraw) Lose: \(countLose)]"
        lblAI.text = "Choose your answer"
        AIAnswer = Int.random(in: -1...1)
    }
}

