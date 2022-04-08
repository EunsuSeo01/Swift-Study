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

    // Add(+) 버튼 눌렀을 때 발생하는 동작 정의.
    @IBAction func didTapAdd() {
        // Show add vc.
        // vc를 뷰컨트롤러로 초기화.
        guard let vc = storyboard?.instantiateViewController(identifier: "addVC") as? AddViewController else {
            return
        }
        
        // title 설정하고 large로 보이지 않게 설정.
        vc.title = "New Reminder"
        vc.navigationItem.largeTitleDisplayMode = .never
        
        // 클로저를 통한 데이터 전달-수신.
        vc.completion = { title, body, date in
            DispatchQueue.main.async {
                // addVC -> 메인 화면으로 다시 화면 전환.
                self.navigationController?.popToRootViewController(animated: true)
                
                // 입력받은 값으로 새 reminder 생성.
                let newReminder = MyReminder(title: title, date: date, identifier: "id_\(title)")
                // models 배열에 새 Reminder를 추가.
                self.models.append(newReminder)
                
                // 테이블뷰 데이터 다시 불러오기.
                self.table.reloadData()
                
                // 알림 설정.
                // 1. notification의 content 설정.
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                // 2. trigger 설정.
                let targetDate = date
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
        
        // addVC로 화면 전환.
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func didTapTest() {
        // Fire test notification.
        // 첫 번째 시도일 경우, notification을 보내도 되는지 유저한테 허락 받아야 한다. (이게 첫 번째!)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                // allow 되면 Schedule test 실행.
                self.scheduleTest()
            }
            else if error != nil {
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
    
    // 셀에 각 행마다 models 배열의 해당 행의 title을 표시.
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
