//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    lazy var scrollView = Subviews().scrollView
    lazy var innerView = Subviews().innerView
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavi()
    }

    override func viewDidLayoutSubviews() {
        setSubviews()
    }
    
    // MARK: - Functions
    
    func setNavi() {
        self.navigationItem.title = "Watch Later"
        
        let naviAppearance = UINavigationBarAppearance()
        naviAppearance.backgroundColor = UIColor(named: "NaviColor")
        naviAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.standardAppearance = naviAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = naviAppearance
    }
    
    func setSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(innerView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            innerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            innerView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            innerView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            innerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            innerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            innerView.heightAnchor.constraint(equalToConstant: 1000)
        ])
        
    }
}

