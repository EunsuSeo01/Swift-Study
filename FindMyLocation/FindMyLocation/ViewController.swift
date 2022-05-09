//
//  ViewController.swift
//  FindMyLocation
//
//  Created by 서은수 on 2022/05/09.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    // MARK: - Properties
    
    // 위치 이벤트를 위해 필요한 프로퍼티들을 선언.
    var locationManager: CLLocationManager!
    var myLocation = CLLocation()
    let geocoder = CLGeocoder()
    let locale = Locale(identifier: "en_US")
    
    // MARK: - Subviews
    
    @IBOutlet weak var mainBackgroundImageView: UIImageView!
    @IBOutlet weak var myLocationLabel: UILabel!
    @IBOutlet weak var findMyLocationButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
        setupTargets()
        makeBackgroundBlur()
    }

    // MARK: - Functions
    
    /// locationManager 설정.
    func setupLocationManager() {
        // 위치 관련 이벤트를 사용하기 위해 CLLocationManager를 생성.
        locationManager = CLLocationManager()
        // locationManager?.desiredAccuracy = kCLLocationAccuracyBest -> Default 값으로 설정돼 있음.
        locationManager?.startUpdatingLocation()
        
        // delegate 설정.
        locationManager?.delegate = self
    }
    
    /// targets 설정.
    func setupTargets() {
        // 버튼 액션 연결.
        findMyLocationButton.addTarget(self, action: #selector(findMyLocationAction), for: .touchUpInside)
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

// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    /// 위치 업데이트 & 설정.
    /// locations에 사용자의 위치 정보가 들어옴. 위도, 경도
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            print("위도: \(coordinate.latitude)")
            print("경도: \(coordinate.longitude)")
            
            myLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        }
    }
    
    /// 권한 변경될 때마다 실행되는 함수.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
        case .denied:
            print("GPS 권한 요청 거부됨")
        default:
            print("GPS: Default")
        }
    }
    
    /// 버튼 눌렀을 때 실행할 액션.
    /// - 위치 권한을 요청한다.
    /// - 현재 위치가 어느 나라의 어느 지역인지 찾아서 지역, 나라의 형태로 label의 텍스트를 바꿔준다.
    @objc func findMyLocationAction() {
        // 위치 권한 요청.
        locationManager?.requestWhenInUseAuthorization()
        
        // 위치 권한이 허용됐을 때만 실행
        if (self.locationManager!.authorizationStatus == .authorizedWhenInUse || self.locationManager!.authorizationStatus == .authorizedAlways) {
            // 어느 나라의 어느 지역인지.
            geocoder.reverseGeocodeLocation(myLocation, preferredLocale: locale) { [weak self] placemarks, _ in
                
                guard let placemarks = placemarks, let address = placemarks.last
                else { return }

                DispatchQueue.main.async {
                    print("\(address.locality ?? ""), \(address.country ?? "")")
                    // 지역, 나라의 형태로 label의 텍스트를 바꿔준다.
                    self?.myLocationLabel.text = "\(address.locality ?? ""), \(address.country ?? "")"
                }
            }
        }
    }
}
