//
//  ViewController.swift
//  CustomFont
//
//  Created by 서은수 on 2022/04/20.
//

import UIKit

class ViewController: UIViewController {

    // 버튼 생성.
    lazy var circleButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Change Font", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
        
        button.backgroundColor = .yellow
        button.layer.cornerRadius = UIScreen.main.bounds.size.width / 6
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        setNavi()
        setSubviews()
    }

    func setNavi() {
        // 네비게이션 바 타이틀 설정.
        self.navigationItem.title = "Custom Font"
        
        // navigation bar 색깔, title 색깔 변경.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(named: "naviColor")   // bar 색 변경.
        
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,    // title 색 변경.
            .font: UIFont(name: "Arial", size: 15)!     // title size 변경.
        ]
        
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    // 서브뷰 설정.
    func setSubviews() {
        // 기본뷰 view에 버튼 추가.
        view.addSubview(circleButton)
        
        // 버튼 레이아웃 설정.
        NSLayoutConstraint.activate([
            circleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            circleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width / 3),
            circleButton.heightAnchor.constraint(equalTo: circleButton.widthAnchor, constant: 0)
        ])
    }
        
}

