//
//  ViewController.swift
//  Flashlight
//
//  Created by 서은수 on 2022/03/23.
//

import UIKit

class ViewController: UIViewController {

    // UI Control들을 코드와 연결하는 작업 -> Ctrl + Drag and Drop
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var flashImageView: UIImageView!
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 버튼을 눌렀을 때 일어날 동작(액션)을 설정하는 것. -> IBAction의 Touch Up Inside
    // 버튼을 눌렀을 때 버튼의 이미지와 배경 이미지를 변경하고자 함.
    @IBAction func switchTapped(_ sender: Any) {
        isOn = !isOn    // 버튼을 누를 때마다 on/off 상태가 바뀌니까!
        
        // 방법 1 : 오리지널 방법
//        if isOn {
//            switchButton.setImage(UIImage(named: "onSwitch"), for: .normal)
//            flashImageView.image = UIImage(named: "onBG")
//        }
//        else {
//            switchButton.setImage(UIImage(named: "offSwitch"), for: .normal)
//            flashImageView.image = UIImage(named: "offBG")
//        }
        
        // 방법 2 : Image literal 사용 -> Xcode 최신 버전에서는 자동 완성 기능이 사라졌다. #imageLiteral( 까지 치면 나오긴 한다.
//        if isOn {
//            switchButton.setImage(#imageLiteral(resourceName: "onSwitch"), for: .normal)
//            flashImageView.image = #imageLiteral(resourceName: "onBG")
//        }
//        else {
//            switchButton.setImage(#imageLiteral(resourceName: "offSwitch"), for: .normal)
//            flashImageView.image = #imageLiteral(resourceName: "offBG")
//        }
        
//        switchButton.setImage(UIImage(named: "onSwitch"), for: .normal)
//        flashImageView.image = #imageLiteral(resourceName: "offBG")
        
        // 방법 3 : 삼항 연산자를 써서 간단하게
        switchButton.setImage(UIImage(named: isOn ? "onSwitch" : "offSwitch"), for: .normal)
        flashImageView.image = UIImage(named: isOn ? "onBG" : "offBG")
    }

}

