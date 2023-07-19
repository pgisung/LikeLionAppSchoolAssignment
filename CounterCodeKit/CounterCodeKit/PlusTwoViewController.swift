//
//  PlusTwoViewController.swift
//  CounterCodeKit
//
//  Created by SONYOONHO on 2023/07/19.
//

import UIKit

class PlusTwoViewController: UIViewController {
    let label: UILabel = UILabel()
    let plusTwoButton: UIButton = UIButton()
    let minusTwoButton: UIButton = UIButton()
    let countModel = CountModel.getModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground

        title = "PlusTwo"
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
        plusTwoButton.setTitle("+2", for: .normal)
        plusTwoButton.setTitleColor(.blue, for: .normal)
        plusTwoButton.addTarget(self, action: #selector(plusTwo), for: .touchUpInside)
        stackView.addArrangedSubview(plusTwoButton)
        
        // -1 버튼
        minusTwoButton.setTitle("-2", for: .normal)
        minusTwoButton.setTitleColor(.blue, for: .normal)
        minusTwoButton.addTarget(self, action: #selector(minusTwo), for: .touchUpInside)
        stackView.addArrangedSubview(minusTwoButton)
    }
    
    @objc func plusTwo() {
        countModel.count += 2
        label.text = String(countModel.count)
    }
    
    @objc func minusTwo() {
        countModel.count -= 2
        label.text = String(countModel.count)
    }
}
