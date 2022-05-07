//
//  CustomCollectionViewCell.swift
//  CarouselEffect
//
//  Created by 서은수 on 2022/05/07.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CarouselCell"

    // MARK: - Subviews
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 레이아웃 설정.
        setupLayout()
        // 속성 설정.
        setupAttributes()
    }

    // MARK: - Functions
    
    // 서브뷰의 레이아웃을 설정하는 함수.
    func setupLayout() {
        
        // contentView의 레이아웃 설정.
        contentView.snp.makeConstraints({ make in
            make.left.equalTo(15)
            make.height.equalTo(UIScreen.main.bounds.height * 0.6)
            make.width.equalTo(UIScreen.main.bounds.width * 0.8)
        })
    }
    
    // atttibutes 설정하는 함수.
    func setupAttributes() {
        
        // label에 왼쪽 간격 설정.
        cellLabel.setMargins(margin: 15)
    }
}

// MARK: - UILabel Extension

extension UILabel {
    
    // Label의 text의 왼쪽에 간격을 주기 위해서 만든 함수.
    func setMargins(margin: CGFloat = 10) {
        
        if let textString = self.text {
            
            // 스타일 생성.
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.firstLineHeadIndent = margin
            paragraphStyle.headIndent = margin
            paragraphStyle.tailIndent = -margin
            
            // 속성 문자열 생성.
            let attributedString = NSMutableAttributedString(string: textString)
            // 위에서 만든 스타일을 속성으로 추가.
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}
