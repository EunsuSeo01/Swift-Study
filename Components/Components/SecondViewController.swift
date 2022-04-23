//
//  SecondViewController.swift
//  Components
//
//  Created by 서은수 on 2022/04/24.
//

import UIKit

class SecondViewController: UIViewController {

    // label에 넣을 값인 list 배열 생성.
    let list = [1,2,3,4,5,6,7,8,9,10]
    
    // 테이블뷰 생성.
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 delegate 설정.
        tableViewDelegate()
        // 테이블뷰를 VC에 등록.
        registerTableView()
    }
    
    // 테이블뷰 레이아웃 설정.
    override func viewDidLayoutSubviews() {
        view.addSubview(tableView)
        // 테이블뷰 셀의 경계선에게 오른쪽 간격을 할당해줌.
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
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

// 테이블뷰 설정.
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 셀 row 갯수 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // 셀 내용 설정.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            preconditionFailure("cell 가져오기 실패")
        }
        
        // Label의 텍스트를 list 배열의 값으로 설정.
        cell.cellNumLabel.text = String(list[indexPath.row])
        
        // 테이블뷰의 셀을 선택할 때 생기는 색상 효과 제거.
        cell.selectionStyle = .none

        return cell
    }
    
    // 셀의 높이 설정.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
