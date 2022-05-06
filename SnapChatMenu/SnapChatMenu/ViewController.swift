//
//  ViewController.swift
//  SnapChatMenu
//
//  Created by 서은수 on 2022/04/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Subviews
    
    lazy var leftView = UIImageView(image: UIImage(named: "left"))
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제스쳐 인식.
        swipeRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        // 서브뷰 레이아웃 설정.
        setupLayout()
    }
    
    // MARK: - Functions
    
    // 서브뷰 레이아웃 설정.
    func setupLayout() {
        view.addSubview(leftView)
        
        leftView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    // view가 오른쪽에서 왼쪽으로 스와이프 하는 제스쳐를 인식할 수 있도록 UISwipeGestureRecognizer를 추가한다.
    func swipeRecognizer() {
        // 제스쳐 인식기 생성. (왼쪽으로 스와이프)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        // 제스쳐 인식기 추가.
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    // 제스쳐 인식했을 때 실행할 이벤트.
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                // 스와이프 시, 원하는 기능 구현.
                // ViewController -> Camera 화면으로 전환.
                let cameraVC = CameraViewController()
                cameraVC.modalPresentationStyle = .fullScreen
                self.presentDetail(cameraVC)
            default: break
            }
        }
    }
}

// MARK: - Extension

extension UIViewController {

    // 화면 전환 될 때 화면이 오른쪽에서 나타나도록 설정.
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    // 화면 전환 될 때 화면이 왼쪽으로 사라지도록(넘어가도록) 설정.
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
