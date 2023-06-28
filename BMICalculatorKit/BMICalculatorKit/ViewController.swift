//
//  ViewController.swift
//  BMICalculatorKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/28.
//

import UIKit

enum EnumBMI: String {
    case UNDERWEIGHT = "UNDERWEIGHT"
    case NORMAL = "NORMAL"
    case RISK_TO_OVERWEIGHT = "RISK_TO_OVERWEIGHT"
    case OVERWEIGHT = "OVERWEIGHT"
    case OBESE = "OBESE"
}

class ViewController: UIViewController {
    // Global Variables
    var operandHeight: Int = 0
    var operandWeight: Int = 0
    var fBMIindex: Float = 0.0
    var enumBMI: EnumBMI = .NORMAL
    var strCalculator: String = "0"
    
    // Closures
    let closureOperateBMI: (Int, Int) -> Float = { (height: Int, weight: Int) -> Float in
        let dividedHeight: Float = Float.closureDiv100(height)
        let squaredHeight: Float = Float.closureSquare(dividedHeight)
        
        guard squaredHeight != 0 else {
            print("Zero can't operate BMI index")
            return 0.0
        }
        
        return Float(weight) / squaredHeight
    }

    // Outlet Variables
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblBMIIndex: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var lblCalculator: UILabel!
    
    // View init
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "You are \(enumBMI.rawValue)"
        lblBMIIndex.text = "Your BMI index is \(fBMIindex)"
        lblInfo.text = "HEIGHT: \(operandHeight), WEIGHT: \(operandWeight)"
        lblCalculator.text = strCalculator
    }

    // Actions
    @IBAction func actionPressNumPad(_ sender: UIButton) {
        let strNum: String = sender.titleLabel?.text ?? "0"
        let iNum: Int = Int(strNum) ?? 0

        switch iNum {
        case 0:
            guard strCalculator != "0" else {
                return
            }
            break
        case 1...9:
            if strCalculator == "0" {
                strCalculator = ""
            }
        default:
            return
        }
        
        strCalculator += strNum
        lblCalculator.text = strCalculator
    }
    
    @IBAction func actionPressReset(_ sender: UIButton) {
        operandHeight = 0
        operandWeight = 0
        fBMIindex = 0.0
        enumBMI = .NORMAL
        strCalculator = "0"
        
        lblResult.text = "You are \(enumBMI.rawValue)"
        lblBMIIndex.text = "Your BMI index is \(fBMIindex)"
        lblInfo.text = "HEIGHT: \(operandHeight), WEIGHT: \(operandWeight)"
        lblCalculator.text = strCalculator
    }
    
    @IBAction func actionPressRemoveFirst(_ sender: UIButton) {
        let iStringCount = strCalculator.count
        
        guard iStringCount != 0 else {
            return
        }
        
        guard iStringCount != 1 else {
            strCalculator = "0"
            lblCalculator.text = strCalculator
            return
        }
        
        strCalculator = String(strCalculator.suffix(iStringCount - 1))
        lblCalculator.text = strCalculator
    }
    
    @IBAction func actionPressBMICalculate(_ sender: UIButton) {
        guard operandHeight > 0 || operandWeight > 0 else {
            print("It can't be calculated without both operands")
            return
        }
        
        fBMIindex = closureOperateBMI( operandHeight, operandWeight )
        lblBMIIndex.text = "Your BMI index is \(fBMIindex)"
        
        switch fBMIindex {
        case ..<18.5:
            enumBMI = .UNDERWEIGHT
        case 18.5...22.9:
            enumBMI = .NORMAL
        case 23.0...24.9:
            enumBMI = .RISK_TO_OVERWEIGHT
        case 25.0...29.9:
            enumBMI = .OVERWEIGHT
        case 30...:
            enumBMI = .OBESE
        default:
            enumBMI = .NORMAL
        }
        lblResult.text = "You are \(enumBMI.rawValue)"
    }
    
    @IBAction func actionPressSetHeight(_ sender: UIButton) {
        guard let height = Int(strCalculator), height > 0 else {
            print("It can't be calculated without both operands")
            return
        }
        
        operandHeight = height
        lblInfo.text = "HEIGHT: \(operandHeight), WEIGHT: \(operandWeight)"
        
        strCalculator = "0"
        lblCalculator.text = strCalculator
    }
    
    @IBAction func actionPressSetWeight(_ sender: UIButton) {
        guard let weight = Int(strCalculator), weight > 0 else {
            print("It can't be calculated without both operands")
            return
        }
        
        operandWeight = weight
        lblInfo.text = "HEIGHT: \(operandHeight), WEIGHT: \(operandWeight)"
        
        strCalculator = "0"
        lblCalculator.text = strCalculator
    }
}

// extensions
extension Float {
    static var closureDiv100: (Int) -> Float {
        get {
            return { (operand: Int) -> Float in
                return Float(operand) / 100.0
            }
        }
    }
    static var closureSquare: (Float) -> Float {
        get {
            return { (operand: Float) -> Float in
                return operand * operand
            }
        }
    }
}

extension UIButton {
    var circleButton: Bool {
        set {
            if newValue {
                self.layer.cornerRadius = 0.5 * self.bounds.size.width
            } else {
                self.layer.cornerRadius = 0
            }
        } get {
            return false
        }
    }
}
