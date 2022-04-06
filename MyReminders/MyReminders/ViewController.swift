//
//  ViewController.swift
//  MyReminders
//
//  Created by 서은수 on 2022/04/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    var models = [MyReminder]()     // 구조체는 생성자가 자동 생성.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }


}


// tableView를 쓰기 위해 delegate와 dataSource 설정.
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        
        return cell
    }
}

// reminder 객체를 담을 구조체 생성.
struct MyReminder {
    var title: String
    var date: Date
    var identifier: String
}
