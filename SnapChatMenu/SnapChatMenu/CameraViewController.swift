//
//  CameraViewController.swift
//  SnapChatMenu
//
//  Created by 서은수 on 2022/04/30.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var captureDevice = AVCaptureDevice.default(for: .video)
    private var session: AVCaptureSession?
    private lazy var output = AVCapturePhotoOutput()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 제스쳐 인식기 생성하고 추가.
        swipeRecognizer()
        // 카메라 세팅.
        settingCamera()
    }
    
    // MARK: - Functions
    
    // 제스쳐 인식기 생성하고 추가.
    func swipeRecognizer() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    // 제스쳐 인식했을 때 실행할 이벤트를 정의.
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                // 스와이프 시, 원하는 기능 구현.
                // Camera -> SecondVC 화면으로 전환.
                let secondVC = SecondViewController()
                secondVC.modalPresentationStyle = .fullScreen
                self.presentDetail(secondVC)
            default: break
            }
        }
    }
    
    // 카메라 세팅.
    func settingCamera() {
        guard let captureDevice = captureDevice else {
            return
        }
        
        do {
            // session 생성.
            session = AVCaptureSession()
            session?.sessionPreset = .photo
            
            // 인풋 생성.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // session에 인풋 아웃풋 설정.
            session?.addInput(input)
            session?.addOutput(output)
        } catch {
            print(error)
        }
        
        guard let session = session else {
            return
        }
        
        // session을 통해 preview layer 생성.
        // AVCaptureVideoPreviewLayer를 통해서 카메라가 현재 찍고있는 물체를 보여준다.
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        // 카메라 화면 프레임 설정.
        previewLayer.frame = view.frame
        // 카메라 화면이 전체 화면이 되도록 설정.
        previewLayer.videoGravity = .resizeAspectFill
        
        // preview layer를 view의 서브 레이어로 추가.
        view.layer.addSublayer(previewLayer)
        
        // session 시작.
        session.startRunning()
    }
    
}
