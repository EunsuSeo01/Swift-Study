//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by 서은수 on 2022/04/21.
//

import UIKit

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
        
        // 네비게이션 바 설정.
        setNavi()
        
        // 테이블뷰 delegate 설정.
        tableViewDelegate()
        // 테이블뷰를 VC에 등록.
        registerTableView()
    }

    override func viewDidLayoutSubviews() {
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
}

// VC 기능 확장.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 셀 갯수 설정.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // cell 안의 내용 설정.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            preconditionFailure("테이블 뷰 가져오기 실패")
        }
        
        cell.videoImageView.image = UIImage(named: videos[indexPath.row].videoImagePath)
        cell.videoLabel.text = videos[indexPath.row].videoLabel
        cell.videoInfo.text = videos[indexPath.row].videoInfo
        
        return cell
    }
    
    // 셀 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.size.height - (navigationController?.navigationBar.bounds.size.height)!)/3
    }
}
