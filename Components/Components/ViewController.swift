//
//  ViewController.swift
//  Components
//
//  Created by 서은수 on 2022/04/15.
//

import UIKit

class ViewController: UIViewController {

    var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "main"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        view.addSubview(mainButton)
        mainButton.addSubview(mainLabel)
        
        mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        mainLabel.centerXAnchor.constraint(equalTo: mainButton.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: mainButton.centerYAnchor).isActive = true
    }

}

