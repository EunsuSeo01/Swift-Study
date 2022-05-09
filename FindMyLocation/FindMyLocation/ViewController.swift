//
//  ViewController.swift
//  FindMyLocation
//
//  Created by 서은수 on 2022/05/09.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Subviews
    
    @IBOutlet weak var mainBackgroundImageView: UIImageView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeBackgroundBlur()
    }

    
    /// background에 blur 효과 주기.
    /// - UIVisualEffectView를 background 크기에 맞게 만들어서 addSubview로 올려주는 방법 사용!
    func makeBackgroundBlur() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredView = UIVisualEffectView(effect: blurEffect)
        blurredView.frame = self.view.bounds
        mainBackgroundImageView.addSubview(blurredView)
    }
}

