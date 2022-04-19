//
//  AppDelegate.swift
//  SimpleStopWatch
//
//  Created by 서은수 on 2022/04/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navVC = UINavigationController(rootViewController: ViewController())
        navVC.isNavigationBarHidden = true
        window?.rootViewController = navVC
        
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        return true
    }

}

