//
//  HomeViewController.swift
//  LoginExercise
//
//  Created by 서은수 on 2022/07/01.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    // MARK: - Subviews
    
    var naverLabel: UILabel = {
        var label = UILabel()
        label.text = "NAVER"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        setLayouts()
    }
    
    // MARK: - Functions

    func setLayouts() {
        view.addSubview(naverLabel)
        naverLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

