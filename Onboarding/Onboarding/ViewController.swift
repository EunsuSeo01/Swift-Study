//
//  ViewController.swift
//  Onboarding
//
//  Created by 서은수 on 2022/04/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 새 유저라면 onboarding을 띄워준다.
        if Core.shared.isNewUser() {
            // Show onboarding.
            let vc = storyboard?.instantiateViewController(withIdentifier: "welcome") as! WelcomeViewController
            
            // 전체 화면으로 present 되도록 설정.
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}

// Underlying logic (Show different view based on NewUser or ExistingUser)
class Core {
    
    static let shared = Core()
    
    // 새 유저인지 확인. (새 유저라면 onboarding flow를 보여줘야 함)
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    // 이제는 새 유저가 아닌 걸로 세팅. => onboarding flow를 이미 본 사람으로 세팅.
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
