//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    var secondsRemaining = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 모든 버튼과 이 함수를 연결.
    @IBAction func keyPressed(_ sender: UIButton) {
        // UIButton의 title을 soundName으로 전달.
        // Optional 해제. -> title 값이 존재할 때만 실행되도록.
        if let title = sender.currentTitle {
            playSound(soundName: title)
        }
        
        // TODO: BOSS Challenge
        // 1. 불투명도를 절반으로 줄인다.
        print("start")
        sender.layer.opacity = 0.5
        
        // 2. 타이머를 생성하여 0.1초마다 secondsRemaining을 0.1만큼 감소시킨다.
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.secondsRemaining -= 0.1
            } else {
                // 3. 남은 시간이 없으면 (= 0.2초가 다 지나면) 불투명도를 원래대로 돌려놓는다.
                sender.layer.opacity = 1.0
                self.secondsRemaining = 0.2
                Timer.invalidate()
                print("end")
            }
        }
    }
    
    func playSound(soundName: String) {
        // soundName에 맞는 wav 파일을 찾아 url을 생성.
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        // url로 player를 만들고 재생.
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

