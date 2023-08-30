//
//  DetailViewController.swift
//  CodeKit
//
//  Created by Jongwook Park on 2023/07/19.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // UINavigationViewController에 현재 navigationViewController의 뷰가 있다면
        // title과 navigationController가 기본 프로퍼티로 호출/활용 가능하다
        title = "Hi"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        buildInterface()
    }
    
    func buildInterface() {
        let safeArea = view.safeAreaLayoutGuide
        
        let label: UILabel = UILabel()
        label.text = "Hello World"
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    }
}
