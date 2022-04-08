//
//  AddViewController.swift
//  MyReminders
//
//  Created by 서은수 on 2022/04/06.
//

import UIKit

// 메인에서 Add(+) 버튼 눌렀을 때 나오는 vc.
class AddViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    }
    
    @objc
    func didTapSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty {
            // datePicker를 통해 실제 date 값을 얻는다.
            let targetDate = datePicker.date
            
            // 입력받은 데이터를 전달.
            completion?(titleText, bodyText, targetDate)
        }
    }

}
