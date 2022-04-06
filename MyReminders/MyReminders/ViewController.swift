//
//  ViewController.swift
//  MyReminders
//
//  Created by 서은수 on 2022/04/06.
//

import UserNotifications
import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    var models = [MyReminder]()     // 구조체는 생성자가 자동 생성.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func didTapAdd() {
        // Show add vc.
    }

    @IBAction func didTapTest() {
        // Fire test notification.
        // 첫 번째 시도일 경우, notification을 보내도 되는지 유저한테 허락 받아야 한다. (이게 첫 번째!)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                // allow 되면 Schedule test 실행.
                self.scheduleTest()
            }
            else if let error = error {
                // don't allow면 print.
                print("error occurred")
            }
        })
    }
    
    func scheduleTest() {
        // 1. notification의 content 설정.
        let content = UNMutableNotificationContent()
        content.title = "Hello World"
        content.sound = .default
        content.body = "My long body. My long body. My long body. My long body."
        
        // 2. trigger 설정.
        let targetDate = Date().addingTimeInterval(10)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        
        // 3. request 생성.
        let request = UNNotificationRequest.init(identifier: "some_long_id", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print("something went wrong")
            }
        })
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
