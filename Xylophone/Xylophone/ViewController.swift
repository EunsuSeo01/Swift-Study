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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 모든 버튼과 이 함수를 연결.
    @IBAction func keyPressed(_ sender: UIButton) {
        // UIButton의 title을 soundName으로 전달.
        playSound(soundName: sender.currentTitle!)
    }
    
    func playSound(soundName: String) {
        // soundName에 맞는 wav 파일을 찾아 url을 생성.
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        
        // url로 player를 만들고 재생.
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

