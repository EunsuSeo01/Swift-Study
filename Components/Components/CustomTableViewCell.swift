//
//  CustomTableViewCell.swift
//  Components
//
//  Created by 서은수 on 2022/04/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // 셀 안에 들어갈 서브뷰 생성.
    lazy var cellNumLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = .systemFont(ofSize: 15, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 초기화 함수.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 셀의 서브뷰 레이아웃 설정.
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // 셀의 서브뷰 레이아웃 설정.
        setUpCell()
    }

    // 셀의 서브뷰 레이아웃 설정.
    func setUpCell() {
        contentView.backgroundColor = .white
        contentView.addSubview(cellNumLabel)
        
        NSLayoutConstraint.activate([
            cellNumLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            cellNumLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
