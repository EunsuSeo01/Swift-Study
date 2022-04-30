//
//  Subviews.swift
//  SnapChatMenu
//
//  Created by 서은수 on 2022/04/30.
//

import Foundation
import UIKit

class Subviews {
    
    static var leftView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "left"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    static var rightView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "right"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}
