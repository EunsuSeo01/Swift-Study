//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/21.
//

import UIKit

class ViewController: UIViewController {

    lazy var scrollView = Subviews().scrollView
    lazy var innerView = Subviews().innerView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        setSubviews()
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

