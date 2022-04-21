//
//  CustomTableViewCell.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // cell에 들어갈 컴포넌트.
    lazy var videoImageView = Subviews().videoImageView
    lazy var videoPlayButton = Subviews().videoPlayButton
    lazy var videoLabel = Subviews().videoLabel
    lazy var videoInfo = Subviews().videoInfo
    
    // 초기화 함수.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }
    
    // 셀 내부 뷰들 레이아웃 설정.
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
}
