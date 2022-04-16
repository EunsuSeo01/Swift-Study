//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by 서은수 on 2022/04/15.
//
//  Navigation bar를 custom하는 방법에 대해 정리.

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    // 커스텀 버튼 생성.
    let nextButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.setTitle("next", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false   // autoresizingMask와 auto layout의 충돌을 방지하기 위해 옵션을 꺼주는 것.
        return btn
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본 view의 배경색 설정. -> 스토리보드 없애서 수동으로 설정해 줘야 함.
        view.backgroundColor = .systemBackground
        
        // 커스텀 네비게이션 바 설정.
        setNavigationBar()
        
        // 버튼의 액션을 설정.
        nextButton.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
    }

    // MARK: - Functions
    
    // 커스텀 네비게이션 바 설정.
    func setNavigationBar() {
        // 커스텀 버튼을 서브뷰로 추가.
        view.addSubview(nextButton)
        
        // 버튼 레이아웃 설정.
        nextButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // 커스텀 버튼을 navigationitem의 right bar button으로 설정!
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: nextButton), animated: true)
        
        // 네비게이션 바 타이틀 설정.
        self.navigationItem.title = "title"
    }
    
    // nextButton을 눌렀을 때 실행되는 메서드.
    @objc func tappedNextButton() {
        // next 버튼을 누르면 나올 화면. 새 뷰 컨트롤러를 생성.
        let nextVC = UIViewController()
        // 기본 view 배경 색 설정.
        nextVC.view.backgroundColor = .systemBackground
        
        // 네비게이션 스택에 nextVC가 push 됨.
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

