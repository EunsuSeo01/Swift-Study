//
//  ViewController.swift
//  PullToRefresh
//
//  Created by 서은수 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    let emojiArray = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    
    // MARK: - Subviews
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttributes()
        setupTableView()
    }
    
    // MARK: - Functions
    
    func setupAttributes() {
        /* tableView attr */
        tableView.backgroundColor = UIColor(named: "background")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
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
