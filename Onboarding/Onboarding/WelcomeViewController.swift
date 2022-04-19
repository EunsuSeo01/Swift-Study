//
//  WelcomeViewController.swift
//  Onboarding
//
//  Created by 서은수 on 2022/04/12.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var holderView: UIView!
    
    // 스크롤 뷰 생성.
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// viewDidLayoutSubviews()
    /// - layout이 결정된 후에 실행되는 메서드.
    /// - 뷰의 bounds(경계)가 변경될 때마다 호출되는 메서드.
    /// - 뷰가 서브 뷰들의 배치를 조정한 직후에 하고 싶은 작업이 있을 때 사용한다.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()   // viewDidLayoutSubviews()의 default implementation은 nothing이기 때문에 이 줄은 안 써줘도 된다고 함.
        configure()
    }
    
    func configure() {
        // 스크롤 뷰 설정.
        scrollView.frame = holderView.bounds
        scrollView.contentSize = CGSize(width: holderView.frame.size.width, height: 0)
        scrollView.isPagingEnabled = true
        holderView.addSubview(scrollView)
        
        // 세 개의 뷰에 각각 들어갈 타이틀을 배열에 저장.
        let titles = ["Welcome", "Location", "All set"]
        
        // 공통된 구조(label-image-button)를 가진 view 3개를 for문을 사용하여 생성.
        for x in 0..<3 {
            // view 생성하고 스크롤 뷰의 서브뷰로 설정.
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width , y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            // view 안에 넣을 label, imageView, button 생성.
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width-20, height: pageView.frame.size.height-60-130-15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width-20, height: 50))
            
            // label 속성 설정 & pageView의 서브뷰로 추가.
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            label.text = titles[x]
            pageView.addSubview(label)
            
            // imageView 속성 설정 & pageView의 서브뷰로 추가.
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x + 1)")
            pageView.addSubview(imageView)
            
            // button 속성 설정 & pageView의 서브뷰로 추가.
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            if x == 2 {
                button.setTitle("Get Started", for: .normal)    // 마지막 뷰(세번째 뷰)의 버튼만 다르게 하려고.
            } else {
                button.setTitle("Continue", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x + 1
            pageView.addSubview(button)
        }
    }
    
    // 버튼 눌렀을 때 실행되는 메서드 정의.
    @objc func didTapButton(_ button: UIButton) {
        guard button.tag < 3 else {
            // dismiss.
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        // scroll to next page.
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
    
    
}
