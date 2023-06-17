//
//  ViewController.swift
//  GreetingMembers
//
//  Created by JOHNNY_MAC_1 on 2023/06/10.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var objSpeechSynthesizer: AVSpeechSynthesizer?
    var m_objDictionary: [String: String] = [
        "원강묵": "무커",
        "박지성": "조니",
        "정석호": "덤보",
        "박정선": "개발마스터",
        "김건섭": "건빵",
        "안효명": "ahn",
        "한아리": "아리랑",
        "박재민": "재민빡"
    ]
    
    @IBOutlet weak var lblGreeting: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        objSpeechSynthesizer = AVSpeechSynthesizer()
    }
    
    @IBAction func actionGreeting(_ sender: UIButton) {
        let strName: String = sender.titleLabel?.text ?? "아무개"
        let strGreeting: String = "안녕하세요 \(strName)님! 별명은 \(m_objDictionary[strName] ?? "아무개별명")입니다."
        let objSpeechUtterance = AVSpeechUtterance(string: strGreeting)
        
        lblGreeting.text = strGreeting
        objSpeechSynthesizer?.speak(objSpeechUtterance)
    }
}

