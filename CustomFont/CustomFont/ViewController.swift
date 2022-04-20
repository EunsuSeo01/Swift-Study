//
//  ViewController.swift
//  CustomFont
//
//  Created by 서은수 on 2022/04/20.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    // 스크롤뷰 생성. -> 세로 스크롤을 위해
    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    // 스크롤뷰 안에 넣을 뷰 생성.
    lazy var innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    // 메인 레이블 생성.
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "30 Days Swift\n\n30일 동안 열심히 해서\n\n30개 다 잘 완성해 보도록 하겠습니다.\n\niOS 개발 너무 재밌는 것 같아요!\n\n진심입니다 😊"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 설정.
        setNavi()
    }
    
    override func viewDidLayoutSubviews() {
        // 서브뷰 설정.
        setSubviews()
    }
    
    // MARK: - Functions
    
    // 네비게이션 바 설정.
    func setNavi() {
        // 네비게이션 바 타이틀 설정.
        self.navigationItem.title = "Custom Font"
        
        // navigation bar 색깔, title 색깔 변경.
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(named: "naviColor")   // bar 색 변경.
        
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,    // title 색 변경.
            .font: UIFont(name: "Arial", size: 17)!     // title size 변경.
        ]
        
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    // 서브뷰 설정.
    func setSubviews() {
        // 기본 뷰 view에 스크롤뷰 추가.
        view.addSubview(scroll)
        
        // 스크롤뷰 안에 내부 뷰 추가.
        scroll.addSubview(innerView)
        // 내부 뷰 안에 서브뷰들 추가.
        innerView.addSubview(circleButton)
        innerView.addSubview(mainLabel)
        
        // 스크롤뷰 레이아웃 설정.
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scroll.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            scroll.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            innerView.topAnchor.constraint(equalTo: scroll.contentLayoutGuide.topAnchor),
            innerView.leftAnchor.constraint(equalTo: scroll.contentLayoutGuide.leftAnchor),
            innerView.rightAnchor.constraint(equalTo: scroll.contentLayoutGuide.rightAnchor),
            innerView.bottomAnchor.constraint(equalTo: scroll.contentLayoutGuide.bottomAnchor),     // height가 길어도 bottom에 대한 레이아웃이 있어야 스크롤뷰가 제대로 작동한다!!!
            innerView.widthAnchor.constraint(equalTo: scroll.frameLayoutGuide.widthAnchor),
            innerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height * 2)
        ])
        
        // 버튼 레이아웃 설정.
        NSLayoutConstraint.activate([
            circleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            circleButton.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            circleButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width / 3),
            circleButton.heightAnchor.constraint(equalTo: circleButton.widthAnchor, constant: 0)
        ])
        
        // 메인 레이블 레이아웃 설정.
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: innerView.safeAreaLayoutGuide.topAnchor, constant: 15),
            mainLabel.leftAnchor.constraint(equalTo: innerView.leftAnchor, constant: 15),
            mainLabel.rightAnchor.constraint(equalTo: innerView.rightAnchor, constant: -15)
        ])
    }
        
}

