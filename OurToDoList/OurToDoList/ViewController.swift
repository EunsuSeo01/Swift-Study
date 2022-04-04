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
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. title 설정
        title = "To Do List"
        
        // 2. tableView 추가
        view.addSubview(table)
        table.dataSource = self
        
        // 3. 오른쪽 위에 + 버튼 추가 (+ 버튼을 눌렀을 때 실행될 action 설정도 가능!)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
    }
    
    // + 버튼을 눌렀을 때 실행될 action 메소드 정의. (alert 띄우기)
    @objc
    private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter new to do list item", preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Enter item..."
        }
        
        // Cacel 버튼 생성.
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // Done 버튼 생성 & 실행할 동작 정의.
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    
                    // Enter new to do list item
                    DispatchQueue.main.async {
                        self?.items.append(text)
                        self?.table.reloadData()
                    }
                }
            }
        }))
        
        present(alert, animated: true)
    }
    
    
    // table에 frame을 줘야 한다.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    // dataSource 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
}

