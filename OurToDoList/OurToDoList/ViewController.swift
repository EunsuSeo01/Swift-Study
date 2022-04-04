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
        
        // 4. 앱이 종료되어도 셀의 내용이 남아있을 수 있도록(디바이스에 저장되도록) 설정
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        
        // 1. title 설정 + 색깔 보라색으로 설정!
        title = "To Do List"
        self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
        self.navigationController?.navigationBar.tintColor = UIColor.purple
        
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
        
        // Cancel 버튼 생성.
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // Done 버튼 생성 & 실행할 동작 정의.
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    
                    // Enter new to do list item
                    DispatchQueue.main.async {
                        // 앱이 종료되어도 셀의 내용이 남아있을 수 있도록 설정.
                        // 이전 셀 내용 불러오기 + 현재 새로 추가되는 셀 내용 추가해서 저장하기.
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                        
                        // items에 인풋 텍스트 추가.
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
        
        // 셀의 내용을 설정.
        // cell.textLabel이 iOS 14.0에서 deprecate 돼서
        // iOS 14 부터는 defaultContentConfiguration()을 사용하라고 나와 있다.
        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
}

