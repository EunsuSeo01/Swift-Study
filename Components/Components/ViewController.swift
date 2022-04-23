//
//  ViewController.swift
//  Components
//
//  Created by 서은수 on 2022/04/15.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "main"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // main 버튼에 액션을 연결.
        mainButton.addTarget(self, action: #selector(tappedMainButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        // 레이아웃 설정.
        view.addSubview(mainButton)
        mainButton.addSubview(mainLabel)
        
        mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        mainLabel.centerXAnchor.constraint(equalTo: mainButton.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: mainButton.centerYAnchor).isActive = true
    }
    
    // MARK: - Functions
    
    // main 버튼 누르면 발생할 액션 설정.
    @objc func tappedMainButton() {
        // secondVC로 가기 위해 객체 생성.
        let secondVC = SecondViewController()
        
        // 전체화면으로 전환하도록 설정.
        secondVC.modalPresentationStyle = .fullScreen
        // secondVC로 화면 전환.
        self.present(secondVC, animated: true, completion: nil)
    }

}

