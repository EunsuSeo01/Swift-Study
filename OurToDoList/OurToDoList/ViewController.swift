//
//  ViewController.swift
//  OurToDoList
//
//  Created by 서은수 on 2022/04/04.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // tableView 생성.
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. title 설정
        title = "To Do List"
        
        // 2. tableView 추가
        view.addSubview(table)
        table.dataSource = self
    }
    
    // table에 frame을 줘야 한다.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    // dataSource 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
}

