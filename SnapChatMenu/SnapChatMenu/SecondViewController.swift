//
//  SecondViewController.swift
//  SnapChatMenu
//
//  Created by 서은수 on 2022/04/30.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Subviews
    
    let rightView = Subviews.rightView
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제스쳐 인식기 생성하고 추가.
        swipeRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        // 서브뷰 레이아웃 설정.
        setupSubviews()
    }

    // MARK: - Functions
    
    // 서브뷰 레이아웃 설정.
    func setupSubviews() {
        view.addSubview(rightView)
        
        NSLayoutConstraint.activate([
            rightView.topAnchor.constraint(equalTo: view.topAnchor),
            rightView.leftAnchor.constraint(equalTo: view.leftAnchor),
            rightView.rightAnchor.constraint(equalTo: view.rightAnchor),
            rightView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
    }

    // 제스쳐 인식기 생성하고 추가.
    func swipeRecognizer() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    // 제스쳐 인식했을 때 실행할 이벤트를 정의.
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                // 스와이프 시, 원하는 기능 구현.
                // secondVC -> 첫 화면(ViewController)으로 전환.
                let vc = ViewController()
                vc.modalPresentationStyle = .fullScreen
                self.presentDetail(vc)
            default: break
            }
        }
    }
    
}
