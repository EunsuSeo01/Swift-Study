//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/21.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var videos = VideoModel().videos
    
    // MARK: - Subviews
    
    private lazy var scrollView = Subviews().scrollView
    private lazy var innerView = Subviews().innerView
    private lazy var tableView = Subviews().tableView
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1st : viewDidLoad")
        
        // 네비게이션 바 설정.
        setNavi()
        
        // 테이블뷰 delegate 설정.
        tableViewDelegate()
        // 테이블뷰를 VC에 등록.
        registerTableView()
    }

    override func viewDidLayoutSubviews() {
        print("1st : viewDidLayoutSubviews")
        // 서브뷰 레이아웃 설정.
        setSubviews()
        // 테이블뷰 구성.
        configureTableView()
    }
    
    // MARK: - Functions
    
    // 네비게이션 바 설정.
    func setNavi() {
        self.navigationItem.title = "Watch Later"
        
        let naviAppearance = UINavigationBarAppearance()
        naviAppearance.backgroundColor = UIColor(named: "NaviColor")
        naviAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.standardAppearance = naviAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = naviAppearance
    }
    
    // 서브뷰 설정.
    func setSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(innerView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            innerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            innerView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor),
            innerView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor),
            innerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            innerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            innerView.heightAnchor.constraint(equalToConstant: 1100)
        ])
    }
    
    // MARK: - Table View
    
    // 테이블뷰 구성.
    func configureTableView() {
        innerView.addSubview(tableView)
        
        // 레이아웃 설정.
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: innerView.topAnchor),
            tableView.leftAnchor.constraint(equalTo: innerView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: innerView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor)
        ])
    }

    // 테이블뷰 delegate 설정. (필수!!)
    func tableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 테이블뷰를 VC에 등록.
    func registerTableView() {
        tableView.register(CustomTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    // MARK: - AVPlayer
    
    // 비디오 재생.
    private func playVideo() {
        print("func : play video")

        let playerController = AVPlayerViewController()
        
        // 비디오 path 설정.
        guard let path = Bundle.main.path(forResource: "emoji zone", ofType:"mp4") else {
            debugPrint("emoji zone.mp4 not found")
            return
        }
        
        // player 생성.
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        
        // 비디오가 끝났는지 확인하는 옵저버 생성.
        NotificationCenter.default.addObserver(self, selector: #selector(finishVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        // 비디오 재생. -> playerController를 present 시킴으로써 비디오가 재생되는 것이다 !!
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    // 비디오가 끝났으면 playerController를 dismiss 시킨다.
    @objc func finishVideo() {
        print("func : finishVideo")
        dismiss(animated: true, completion: nil)
    }

}

// VC 기능 확장.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 셀 갯수 설정.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // 셀 안의 내용 설정.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            preconditionFailure("테이블 뷰 가져오기 실패")
        }
        
        cell.videoImageView.image = UIImage(named: videos[indexPath.row].videoImagePath)
        cell.videoLabel.text = videos[indexPath.row].videoLabel
        cell.videoInfo.text = videos[indexPath.row].videoInfo
        
        // 셀 안의 버튼을 눌렀을 때 실행될 기능을 클로저를 통해 구현한 것이다 !!
        cell.playButtonAction = { [unowned self] in
            // 기능 구현 위치.
            print("playVideo in closure")
            // 비디오 재생.
            playVideo()
        }
        
        return cell
    }
    
    // 셀 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.size.height - (navigationController?.navigationBar.bounds.size.height)!)/3
    }
}
