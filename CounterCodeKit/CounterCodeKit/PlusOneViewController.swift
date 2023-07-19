//
//  PlusOneViewController.swift
//  CounterCodeKit
//
//  Created by SONYOONHO on 2023/07/19.
//

import UIKit

class PlusOneViewController: UIViewController {
    let label: UILabel = UILabel()
    let plusOneButton: UIButton = UIButton()
    let minusOneButton: UIButton = UIButton()
    let countModel = CountModel.getModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        title = "PlusOne"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        buildInterface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        label.text = "\(countModel.count)"
    }
    
    func buildInterface() {
        // 값 레이블
        label.text = "\(countModel.count)"
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 스택 뷰
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        
        // +1 버튼
        plusOneButton.setTitle("+1", for: .normal)
        plusOneButton.setTitleColor(.blue, for: .normal)
        plusOneButton.addTarget(self, action: #selector(plusOne), for: .touchUpInside)
        stackView.addArrangedSubview(plusOneButton)
        
        // -1 버튼
        minusOneButton.setTitle("-1", for: .normal)
        minusOneButton.setTitleColor(.blue, for: .normal)
        minusOneButton.addTarget(self, action: #selector(minusOne), for: .touchUpInside)
        stackView.addArrangedSubview(minusOneButton)
    }
    
    @objc func plusOne() {
        countModel.count += 1
        label.text = String(countModel.count)
    }
    
    @objc func minusOne() {
        countModel.count -= 1
        label.text = String(countModel.count)
    }
}
