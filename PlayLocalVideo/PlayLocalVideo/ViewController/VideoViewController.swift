//
//  VideoViewController.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/23.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {
    
    // playerVC 생성.
    var playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 비디오 재생.
        playVideo()
    }

    // 비디오 재생.
    private func playVideo() {
        print("play video")
        // 비디오 path 설정.
        guard let path = Bundle.main.path(forResource: "emoji zone", ofType:"mp4") else {
            debugPrint("emoji zone.mp4 not found")
            return
        }
        
        // player 생성.
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        
        // 비디오가 끝났는지 확인하는 옵저버 생성.
        NotificationCenter.default.addObserver(self, selector: #selector(finishVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        // 비디오 재생.
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    // 미완성.
    @objc func finishVideo() {
        self.playerController.dismiss(animated: true, completion: nil)  // 왜 dismiss를 했는데 까만화면이...?
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
