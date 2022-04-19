//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by 서은수 on 2022/04/19.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    // label 생성.
    lazy var secondsLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 100, weight: .ultraLight)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // play 버튼이 들어갈 파란색 뷰 생성.
    lazy var playView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "playViewColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // pause 버튼이 들어갈 초록색 뷰 생성.
    lazy var pauseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "pauseViewColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // play 버튼 생성.
    lazy var playButton: UIButton = {
        let button = UIButton()
        if let image = UIImage(named: "play") {
            print("image setting")
            button.setImage(image, for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // pause 버튼 생성.
    lazy var pauseButton: UIButton = {
        let button = UIButton()
        if let image = UIImage(named: "pause") {
            print("image setting")
            button.setImage(image, for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // reset 버튼 생성.
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reset 버튼 액션 연결.
        resetButton.addTarget(self, action: #selector(resetSeconds), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        setSubviews()
    }
    
    
    // MARK: - Functions
    
    // 서브뷰 설정.
    func setSubviews() {
        // view의 서브뷰로 추가.
        view.addSubview(secondsLabel)
        view.addSubview(playView)
        view.addSubview(pauseView)
        view.addSubview(resetButton)
        
        // 버튼을 해당하는 view의 서브뷰로 추가.
        playView.addSubview(playButton)
        pauseView.addSubview(pauseButton)
        
        // label 레이아웃 설정.
        secondsLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.size.height/5).isActive = true
        secondsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        // playView 레이아웃 설정.
        NSLayoutConstraint.activate([playView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     playView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     playView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width / 2 - 1),
                                     playView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 2 + 80)])
        
        // pauseView 레이아웃 설정.
        NSLayoutConstraint.activate([pauseView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     pauseView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                     pauseView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width / 2 - 1),
                                     pauseView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 2 + 80)])
        
        // playButton 레이아웃 설정.
        playButton.centerXAnchor.constraint(equalTo: playView.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: playView.centerYAnchor).isActive = true
        
        // pauseButton 레이아웃 설정.
        pauseButton.centerXAnchor.constraint(equalTo: pauseView.centerXAnchor).isActive = true
        pauseButton.centerYAnchor.constraint(equalTo: pauseView.centerYAnchor).isActive = true
        
        // resetButton 레이아웃 설정.
        resetButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
    }
    
    // seconds를 reset 한다.
    @objc func resetSeconds() {
        secondsLabel.text = "0.0"
    }
}

