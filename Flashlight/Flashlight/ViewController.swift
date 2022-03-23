//
//  ViewController.swift
//  Flashlight
//
//  Created by 서은수 on 2022/03/23.
//

import UIKit
import AVFoundation     // 사운드 파일 재생, 플래시를 켜기 위해.

class ViewController: UIViewController {

    // UI Control들을 코드와 연결하는 작업 -> Ctrl + Drag and Drop
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var flashImageView: UIImageView!
    var isOn = false
    
    var soundPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareSound();
    }
    
    // 사운드 play를 준비하는 함수. -> 사운드 파일의 경로를 가져와서 플레이어를 만든다.
    func prepareSound() {
        let path = Bundle.main.path(forResource: "switch.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.prepareToPlay()    // play 전에 미리 메모리에 로드해두고 준비하는 것.
        } catch {
            // couldn't load file :(
        }
    }
    
    // 핸드폰의 플래시를 켜주는 함수.
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    // 버튼을 눌렀을 때 일어날 동작(액션)을 설정하는 것. -> IBAction의 Touch Up Inside
    // 버튼을 눌렀을 때 버튼의 이미지와 배경 이미지를 변경하고자 함.
    @IBAction func switchTapped(_ sender: Any) {
        isOn = !isOn    // 버튼을 누를 때마다 on/off 상태가 바뀌니까!
        
        soundPlayer?.play();    // 버튼 누를 때마다 사운드 재생.
        toggleTorch(on: isOn)   // isOn == true일 때 핸드폰의 플래시를 켠다.
        
        // 방법 3 : 삼항 연산자를 써서 간단하게
        switchButton.setImage(UIImage(named: isOn ? "onSwitch" : "offSwitch"), for: .normal)
        flashImageView.image = UIImage(named: isOn ? "onBG" : "offBG")
        
        
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
        
    }

}

