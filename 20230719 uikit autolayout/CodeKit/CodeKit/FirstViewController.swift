//
//  ViewController.swift
//  CodeKit
//
//  Created by Jongwook Park on 2023/07/19.
//

import UIKit

class FirstViewController: UIViewController {
    
    // 메모리에 ViewController의 view가 자리잡기 완료되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // UINavigationViewController에 현재 navigationViewController의 뷰가 있다면
        // title과 navigationController가 기본 프로퍼티로 호출/활용 가능하다
        title = "First"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        buildInterface()
    }

    func buildInterface() {
        let safeArea = view.safeAreaLayoutGuide
        
        let scrollView: UIScrollView = UIScrollView()
        scrollView.backgroundColor = .systemMint
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 2)
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        scrollView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        
        // UIStackView에 subview를 추가하려면
        // 직접 각각의 AutoLayout을 설정하지 말고
        // 있는 그대로 UIStackView에 addArrangedSubview 처리를 하면 된다
        // 단, 스스로 높이와 넓이 처리 정도는 해도 되겠다 (예, 버튼)
        
        for _ in 0...20 {
            let label: UILabel = UILabel()
            label.text = "Hello World"
            stackView.addArrangedSubview(label)
            
            let nextButton: UIButton = UIButton()
            nextButton.setTitle("다음 화면으로!", for: .normal)
            nextButton.backgroundColor = .purple
            nextButton.addTarget(self, action: #selector(goNext), for: .touchUpInside)
            stackView.addArrangedSubview(nextButton)
        }
    }
    
    @objc func goNext() {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

