//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by 서은수 on 2022/04/19.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    // 초(seconds) 부분을 나타내는 label 생성.
    lazy var seconds: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 90, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "0"
        return label
    }()
    
    // 소수점을 나타내는 label 생성.
    lazy var decimalPoint: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 90, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "."
        return label
    }()
    
    // 소수점 이하 첫번째 자리를 나타내는 label 생성.
    lazy var firstDigit: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 90, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "0"
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
    
    // MARK: - Properties
    
    // stop watch가 작동 중인지 아닌지.
    lazy var isRunning = false
    
    // Timer의 중복 생성을 막기 위해 (하나의 Timer만 돌아가도록 하기 위해) 만든 구분 변수.
    lazy var initialTimerNum = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 각 버튼의 액션을 연결.
        playButton.addTarget(self, action: #selector(startStopWatch), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseStopWatch), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetSeconds), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        setSubviews()
    }
    
    
    // MARK: - Functions
    
    // 서브뷰 설정.
    func setSubviews() {
        // view의 서브뷰로 추가.
        view.addSubview(seconds)
        view.addSubview(decimalPoint)
        view.addSubview(firstDigit)
        view.addSubview(playView)
        view.addSubview(pauseView)
        view.addSubview(resetButton)
        
        // 버튼을 해당하는 view의 서브뷰로 추가.
        playView.addSubview(playButton)
        pauseView.addSubview(pauseButton)
        
        // 시간에 대한 label 레이아웃 설정.
        // 소수점의 레이아웃 설정.
        decimalPoint.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.size.height/5).isActive = true
        decimalPoint.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        // 초(seconds) label의 레이아웃 설정.
        seconds.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.size.height/5).isActive = true
        seconds.rightAnchor.constraint(equalTo: decimalPoint.leftAnchor, constant: -5).isActive = true
        
        // 소수점 아래 첫번째 자리 label의 레이아웃 설정.
        firstDigit.centerYAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.size.height/5).isActive = true
        firstDigit.leftAnchor.constraint(equalTo: decimalPoint.rightAnchor, constant: 5).isActive = true
        
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
    
    // play 버튼 누르면 stop watch 시작!
    @objc func startStopWatch() {
        isRunning = true    // 작동 중.
        initialTimerNum += 1    // Timer는 1개.
        
        // Timer의 중복 생성을 막기 위해 작동 중에 Timer를 한 번만 만든다.
        if self.initialTimerNum == 1 {
            // 0.1초 시간 간격. -> 0.1초가 10번 지나면 1초.
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
                // stop watch가 작동 중이면,
                // 0.1초마다 label의 텍스트도 0.1을 더한 숫자가 보이도록 설정한다.
                if self.isRunning {
                    // 소수점 아래 첫번째 자리 숫자 1 증가시킴.
                    self.firstDigit.text = String(Int(self.firstDigit.text!)! + 1)
                    
                    // 소수점 아래 첫번째 자리가 10이 되면 1초가 됨. -> 1초 증가.
                    if self.firstDigit.text == "10" {
                        self.firstDigit.text = "0"      // 소수점 아래 첫번째 자리는 다시 0으로 초기화.
                        self.seconds.text = String(Int(self.seconds.text!)! + 1)    // 1초 증가.
                    }
                } else {
                    Timer.invalidate()
                }
            }
        }
    }
    
    // pause 버튼 누르면 stop watch 멈춤. (작동 중 아님)
    @objc func pauseStopWatch() {
        isRunning = false
        initialTimerNum = 0
    }
    
    // seconds와 firstDigit를 reset 한다.
    @objc func resetSeconds() {
        seconds.text = "0"
        firstDigit.text = "0"
        initialTimerNum = 0
    }
}

