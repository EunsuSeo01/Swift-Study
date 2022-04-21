//
//  AppDelegate.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigation = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigation
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()
       
        return true
    }

}
