//
//  ViewController.swift
//  HelloUIKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/09.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var helloLabel: UILabel!
    
    let speechSynth: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sayHello(_ sender: Any) {
        let name: String = nameField.text ?? ""
        let message: String = "Hi \(name)"
        helloLabel.text = message
        
        var utterance: AVSpeechUtterance = AVSpeechUtterance(string: message)
        speechSynth.speak(utterance)
    }
}

