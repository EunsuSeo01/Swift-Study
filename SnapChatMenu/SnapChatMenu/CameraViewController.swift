//
//  CameraViewController.swift
//  SnapChatMenu
//
//  Created by 서은수 on 2022/04/30.
//

import UIKit

class CameraViewController: UIViewController {

    // 테스트용 label 생성.
    let label: UILabel = {
        let label = UILabel()
        label.text = "Camera"
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        // label을 view에 추가.
        super.viewDidLoad()

        // label 레이아웃 설정.
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 제스쳐 인식기 생성하고 추가.
        swipeRecognizer()
    }
    
    // MARK: - Functions
    
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
                // Camera -> SecondVC 화면으로 전환.
                let secondVC = SecondViewController()
                secondVC.modalPresentationStyle = .fullScreen
                self.presentDetail(secondVC)
            default: break
            }
        }
    }
    
    // Camera

}
