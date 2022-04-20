//
//  AppDelegate.swift
//  CustomFont
//
//  Created by 서은수 on 2022/04/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 네비게이션 컨트롤러 생성!
        let navController = UINavigationController()
        let viewController = ViewController()   // <- ViewController.swift 파일의 그 ViewController 클래스를 뜻하는 것.

        // 현재 네비게이션 스택에 있는 VC 배열 값을 설정한 것. (viewController 하나 들어있는 배열로!)
        navController.viewControllers = [viewController]
        // 루트 VC를 네비게이션 컨트롤러로 설정.
        window?.rootViewController = navController
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .black
        
        return true
    }

}

