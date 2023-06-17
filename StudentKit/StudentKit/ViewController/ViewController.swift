//
//  ViewController.swift
//  StudentKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/14.
//

import UIKit

//let students: [String] = ["윤경환", "김강호", "차은우", "최하늘", "박은빈", "조희진"]

class ViewController: UIViewController {

    @IBOutlet weak var labelStudents: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var studentsText: String = ""
        
//        for student in students {
//            studentsText += "\(student)\n"
//        }
        
        labelStudents.text = studentsText
    }
    
    
}

