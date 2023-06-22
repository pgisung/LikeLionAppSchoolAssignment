//
//  ViewController.swift
//  ChooseKit
//
//  Created by 안지영 on 2023/06/22.
//

import UIKit
import AVFoundation

struct MainQuestion {
    var question: String
    var items: [String]
    var result: String
    var imagePath: String
}

let objMainQuestion: [MainQuestion] = [
    MainQuestion(question: "2의 자승과 같은 것으로 올바른 것은?", items: ["2의 10승", "이의 재승", "이재승", "2의 제곱"], result: "2의 제곱", imagePath: "1번"),
    MainQuestion(question: "SwiftUI 앱 개발에 사용되는 언어는?", items: ["Swift", "Java", "C++", "kotlin"], result: "Swift", imagePath: "2번"),
    MainQuestion(question: "다음 중 우리나라에 실제로 존재하지 않는 도로명은 무엇일까요?", items: ["귀성길", "먹방길", "윤봉길", "댕댕이길"], result: "윤봉길", imagePath: "3번"),
    MainQuestion(question: "세계 최대의 동영상 공유 플랫폼 유튜브에서 세계 최초로 업로드된 동영상의 제목은?", items: ["떡볶이 먹방", "그가 술을 마신 이유", "동물원에서의 나", "재미있는 순간들"], result: "동물원에서의 나", imagePath: "4번"),
    MainQuestion(question: "작년 미국의 시사 주간지 타임지에서는 1999년에 베스트 인물로 인기 가수 리키 마틴과 애니메이션 포켓몬의 주인공 “이것”을 선정했습니다. ‘이것’의 이름은?", items: ["번개맨", "피카츄", "꼬부기", "펭수"], result: "피카츄", imagePath: "5번"),
    MainQuestion(question: "도희님이 키우는 고양이의 몸무게는?", items: ["6 Kg", "7 Kg", "8 Kg", "9 Kg"], result: "8 Kg", imagePath: "6번.jpg"),
    MainQuestion(question: "다음중 프링글스에 없는 맛은?", items: ["콜라맛", "와사비맛", "김치맛", "커피맛"], result: "커피맛", imagePath: "7번"),
    MainQuestion(question: "다음중 걸그룹의 데뷔곡으로 틀린 것은?", items: ["아이브 - eleven", "뉴진스 - attetion", "르세라핌 - Antifragile", "(여자)아이들 - latata"], result: "르세라핌 - Antifragile", imagePath: "8번 copy"),
    MainQuestion(question: "6/21 디스코드에서 나온 노래 중 신청곡이 아닌것은?", items: ["지오디 - 어머님께", "서태지 - 소격동", "러브홀릭 - LoveHolic", "볼빨간사춘기 - Mermaid"], result: "지오디 - 어머님께", imagePath: "9번"),
    MainQuestion(question: "다음 중 현재 우리가 사용하는 SwiftUI 주교재의 저자 이름으로 알맞은 것은?", items: ["닐 스미스", "닐 캐서디" ,"네드 팍", "샘 스미스"], result: "닐 스미스", imagePath: "10번")
]


enum CorrectNumber {
    case lowScore
    case middleScore
    case highScore
    case perfectScore
    
    func getRange() -> ClosedRange<Int> {
        var startIndex: Int = 0
        var endIndex: Int = 0
        
        switch self {
        case .lowScore :
            startIndex = 0
            endIndex = 4
        case .middleScore :
            startIndex = 5
            endIndex = 7
        case .highScore :
            startIndex = 8
            endIndex = 9
        case .perfectScore :
            startIndex = 10
            endIndex = 10
        }
        
        return startIndex...endIndex
    }
}


class ViewController: UIViewController {
    
    let speechSynth = AVSpeechSynthesizer()
    
    var strQuestions: String = objMainQuestion[0].question
    
    var strResult: String = ""
    
    var correctCount: Int = 0
    var wrongCount: Int = 0
    var resetCount: Int = 0
    
    var index: Int = 0
    
    var enuminst: CorrectNumber = .lowScore
    
    
    var strFirstQuestionNumber: String = objMainQuestion[0].items[0]
    var strSecondQuestionNumber: String = objMainQuestion[0].items[1]
    var strThirdQuestionNumber: String = objMainQuestion[0].items[2]
    var strFourthQuestionNumber: String = objMainQuestion[0].items[3]
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var endLabel: UILabel!
    
    @IBOutlet weak var firstButtonLabel: UIButton!
    
    @IBOutlet weak var secondButtonLabel: UIButton!
    
    @IBOutlet weak var thirdButtonLabel: UIButton!
    
    @IBOutlet weak var fourthButtonLabel: UIButton!
    
    
    @IBOutlet weak var showResultLabel: UILabel!
    
    
    @IBOutlet weak var resetButtonLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionLabel.text = strQuestions
        
        firstButtonLabel.setTitle(strFirstQuestionNumber, for: .normal)
        secondButtonLabel.setTitle(strSecondQuestionNumber, for: .normal)
        thirdButtonLabel.setTitle(strThirdQuestionNumber, for: .normal)
        fourthButtonLabel.setTitle(strFourthQuestionNumber, for: .normal)
        
        resultLabel.text = "현재 맞은 갯수: \(correctCount) / 틀린 갯수 : \(wrongCount)"
        
        imageView.image = UIImage(named: objMainQuestion[0].imagePath)
        
        endLabel.isHidden = true
        
        resetButtonLabel.isHidden = true
        
        
        
    }
    
    func checkCorrect(_ sender: UIButton) {
        
        
            
        // 정,오답 체크 구현
        if sender.titleLabel?.text ?? "" == objMainQuestion[index].result {
            correctCount += 1
            resetCount = 0
            showResultLabel.text = "진심 천재만재 아니세요?"
            let correctUtterance = AVSpeechUtterance(string: "진심 천재만재 아니세요?")
            //speechSynth.speak(correctUtterance)
        } else {
            wrongCount += 1
            resetCount += 1
            showResultLabel.text = "진심이세요?"
            let wrongUtterance = AVSpeechUtterance(string: "진심이세요?")
           // speechSynth.speak(wrongUtterance)

        }
        
        resultLabel.text = "현재 맞은 갯수: \(correctCount) / 틀린 갯수 : \(wrongCount)"
        
        
        // 연속 3개 틀리면 reset 하는 함수 호출
        if 2 < resetCount {
            
            isVisible(false)
            endLabel.text = "진심이세요? \n 3초간 벽 보고 반성하세요🥺"
            return
            
            /*
            index = -1
            correctCount = 0
            wrongCount = 0
            resetCount = 0
            
            resultLabel.text = "현재 맞은 갯수: \(correctCount) / 틀린 갯수 : \(wrongCount)"
             */
        }
        
        // 마지막 문제에서 에러나지 않게 가드문처리
        guard index < objMainQuestion.count - 1 else {
            isVisible(false)
            endLabel.text = "끝났습니다🥳"
            return }
        
        // 페이지 전환
        index += 1
        
        questionLabel.text = objMainQuestion[index].question
        
        firstButtonLabel.setTitle(objMainQuestion[index].items[0], for: .normal)
        secondButtonLabel.setTitle(objMainQuestion[index].items[1], for: .normal)
        thirdButtonLabel.setTitle(objMainQuestion[index].items[2], for: .normal)
        fourthButtonLabel.setTitle(objMainQuestion[index].items[3], for: .normal)
        
        imageView.image = UIImage(named: objMainQuestion[index].imagePath)
        
    }
    
    
    func isVisible(_ isVisible: Bool) {
        
        if !isVisible {
            endLabel.isHidden = false
            resetButtonLabel.isHidden = false
            questionLabel.isHidden = true
            resultLabel.isHidden = true
            imageView.isHidden = true
            firstButtonLabel.isHidden = true
            secondButtonLabel.isHidden = true
            thirdButtonLabel.isHidden = true
            fourthButtonLabel.isHidden = true
            showResultLabel.isHidden = true
            resultLabel.isHidden = true
        } else {
            endLabel.isHidden = true
            resetButtonLabel.isHidden = true
            questionLabel.isHidden = false
            resultLabel.isHidden = false
            imageView.isHidden = false
            firstButtonLabel.isHidden = false
            secondButtonLabel.isHidden = false
            thirdButtonLabel.isHidden = false
            fourthButtonLabel.isHidden = false
            showResultLabel.isHidden = false
            resultLabel.isHidden = false
        }
    }
    
    
    
    
    @IBAction func selectButton(_ sender: UIButton) {
         
        // 눌리면 정답/오답 확인하기
        checkCorrect(sender)
        
    }
    
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        isVisible(true)
        
        index = 0
        correctCount = 0
        wrongCount = 0
        resetCount = 0
        
        
        questionLabel.text = strQuestions
        
        firstButtonLabel.setTitle(strFirstQuestionNumber, for: .normal)
        secondButtonLabel.setTitle(strSecondQuestionNumber, for: .normal)
        thirdButtonLabel.setTitle(strThirdQuestionNumber, for: .normal)
        fourthButtonLabel.setTitle(strFourthQuestionNumber, for: .normal)
        
        resultLabel.text = "현재 맞은 갯수: \(correctCount) / 틀린 갯수 : \(wrongCount)"
        
        imageView.image = UIImage(named: objMainQuestion[0].imagePath)
        
        
    }
    
    
    
    
    /*
     일단ㄴ..
     1) 동작 첫 화면  ==> viewDidLoad
     2) 문제를 담을..?
     
     */
    
    
    
    
    
    
}

