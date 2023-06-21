//
//  ViewController.swift
//  RandomNumberGameKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var arrImages: [UIImage] = []
    var iAnswer: Int = 0
    let range = 0...9
    var objSpeechSynthesizer: AVSpeechSynthesizer?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if( initialize() == false ){
            // initialize failed
        }
    }
    
    func initialize() -> Bool {
        var bReturn: Bool = false
        
        repeat{
            iAnswer = Int.random(in: range)
            objSpeechSynthesizer = AVSpeechSynthesizer()
            
            for imgIndex in range {
                var objImage: UIImage?
                
                if imgIndex % 2 != 0 {
                    objImage = UIImage(named: "f\(imgIndex).jpg")
                } else {
                    objImage = UIImage(named: "m\(imgIndex).jpg")
                }
                
                if let image = objImage {
                    arrImages.append(image)
                }
            }
            
            imageView.image = arrImages[iAnswer]
            
            bReturn = true
        } while(false)
        
        return bReturn
    }
    
    func funcQuiz(_ num: Int) {
        var strMessage: String = "숫자를 고르세요"
        switch num {
        case range where num > iAnswer:
            strMessage = "정답은 더 작은 수 입니다"
            break
        case range where num < iAnswer:
            strMessage = "정답은 더 큰 수 입니다"
            break
        case range where num == iAnswer:
            strMessage = "축하해요! 정답입니다"
            break
        default:
            break
        }
        
        let objSpeechUtterance = AVSpeechUtterance(string: strMessage)
        
        lblMessage.text = strMessage
        objSpeechSynthesizer?.speak(objSpeechUtterance)
    }
    
    @IBAction func actionNumber(_ sender: UIButton) {
        let strAnswer: String = sender.subtitleLabel?.text ?? "1"
        let iAnswer: Int = Int(strAnswer) ?? 1
        
        funcQuiz(iAnswer)
    }
    
    @IBAction func actionShuffleImages(_ sender: UIButton) {
        arrImages.shuffle()
        arrImages = arrImages.shuffled()
        imageView.image = arrImages[iAnswer]
    }
    
    @IBAction func actionReset(_ sender: UIButton) {
        let strText: String = "숫자를 고르세요"
        let objSpeechUtterance = AVSpeechUtterance(string: strText)
        lblMessage.text = strText
        objSpeechSynthesizer?.speak(objSpeechUtterance)
        iAnswer = Int.random(in: range)
        imageView.image = arrImages[iAnswer]
    }
}

