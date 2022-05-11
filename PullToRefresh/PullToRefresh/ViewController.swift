//
//  ViewController.swift
//  PullToRefresh
//
//  Created by 서은수 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    lazy var emojiArray = [
        "🤗🤗🤗🤗🤗",
        "😅😅😅😅😅",
        "😆😆😆😆😆"
    ]
    lazy var updatedDate = Date()
    lazy var numOfRuns = 0
    
    // 새로 넣을 이모지 데이터.
    let newEmojiArray = [
        "🎬🎬🎬🎬🎬",
        "👸🏻👸🏻👸🏻👸🏻👸🏻",
        "🏃🏻‍♂️🏃🏻‍♂️🏃🏻‍♂️🏃🏻‍♂️🏃🏻‍♂️"
    ]
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    // 프로젝트에 사용되는 색깔들 이름을 enum으로 정리.
    enum usedColor: String {
        case background = "backgroundColor"
        case refresh = "refreshColor"
    }
    
    // MARK: - Subviews
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupAttributes()
        updateRefreshTitle()
        setupTargets()
    }
    
    // MARK: - Functions
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupAttributes() {
        /* tableView attr */
        tableView.backgroundColor = UIColor(named: usedColor.background.rawValue)
        
        // refresh 기능을 위해 tableView의 UIRefreshControl 객체를 초기화 한다 !!
        tableView.refreshControl = UIRefreshControl()
        // refresh로 위에 생기는 부분 배경색 설정.
        tableView.refreshControl?.backgroundColor = UIColor(named: usedColor.refresh.rawValue)
        // refresh 모양 색깔 설정.
        tableView.refreshControl?.tintColor = .white
    }
    
    // refreshControl의 title 재설정(= 업데이트).
    func updateRefreshTitle() {
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Last Updated \(updatedDate)", attributes: attributes)
    }
    
    func setupTargets() {
        // refresh 하면 실행될 함수 연결.
        tableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    // refresh 하면 실행될 함수.
    @objc func pullToRefresh() {
        // 최초의 refresh일 때에만 이모지를 추가한다.
        if numOfRuns == 0 {
            // 테이블뷰에 입력되는 데이터를 갱신한다!
            newEmojiArray.forEach { emojiArray.insert($0, at: 0) }
        }
        
        numOfRuns += 1
        
        // updatedDate를 현재로 업데이트.
        updatedDate = Date.now
        // 타이틀 업데이트.
        updateRefreshTitle()
        
        // 테이블뷰 새로고침.
        tableView.reloadData()
        // 당기는 게 끝나면 refresh도 끝나도록.
        tableView.refreshControl?.endRefreshing()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 셀 갯수 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArray.count
    }
    
    // 셀 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // 셀 내용 설정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            preconditionFailure("테이블 뷰 가져오기 실패")
        }
        
        cell.emojiLabel.text = emojiArray[indexPath.row]
        
        return cell
    }
    
    // cell이 화면에 보여지기 직전에 호출되는 함수.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 셀의 원래 배경색을 clear. -> 내가 색을 지정하기 위해서(?)
        cell.backgroundColor = UIColor.clear
    }
}
