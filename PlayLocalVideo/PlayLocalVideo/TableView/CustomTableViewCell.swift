//
//  CustomTableViewCell.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/22.
//

import UIKit
import AVKit
import AVFoundation

class CustomTableViewCell: UITableViewCell {
    
    // cell에 들어갈 컴포넌트.
    lazy var videoImageView = Subviews().videoImageView
    lazy var videoPlayButton = Subviews().videoPlayButton
    lazy var videoLabel = Subviews().videoLabel
    lazy var videoInfo = Subviews().videoInfo
    
    // 필요한 VC들.
    lazy var vc = ViewController()
    lazy var videoVC = VideoViewController()
    
    // 초기화 함수.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 셀 서브뷰들 레이아웃 설정.
        setUpCell()
        // 버튼과 로직 연결.
        videoPlayButton.addTarget(self, action: #selector(tappedPlayButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // 셀 서브뷰들 레이아웃 설정.
        setUpCell()
        // 버튼과 로직 연결.
        videoPlayButton.addTarget(self, action: #selector(tappedPlayButton), for: .touchUpInside)
    }
    
    // 셀 서브뷰들 레이아웃 설정.
    func setUpCell() {
        contentView.addSubview(videoImageView)
        contentView.addSubview(videoPlayButton)
        contentView.addSubview(videoLabel)
        contentView.addSubview(videoInfo)
        
        NSLayoutConstraint.activate([
            videoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            videoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            videoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            videoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            videoPlayButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            videoPlayButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            videoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            videoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            videoInfo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            videoInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    // 버튼을 누르면 아래에서 화면이 올라오고 비디오가 재생된다.
    @objc func tappedPlayButton() {
        print("click")
        // 전체화면으로.
        videoVC.modalPresentationStyle = .fullScreen
        // 비디오가 재생될 화면을 띄워준다.
        self.window?.rootViewController?.present(videoVC, animated: true, completion: nil)
    }
}
