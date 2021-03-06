//
//  ViewController.swift
//  PullToRefresh
//
//  Created by μμμ on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    lazy var emojiArray = [
        "π€π€π€π€π€",
        "πππππ",
        "πππππ"
    ]
    lazy var updatedDate = Date()
    lazy var numOfRuns = 0
    
    // μλ‘ λ£μ μ΄λͺ¨μ§ λ°μ΄ν°.
    let newEmojiArray = [
        "π¬π¬π¬π¬π¬",
        "πΈπ»πΈπ»πΈπ»πΈπ»πΈπ»",
        "ππ»ββοΈππ»ββοΈππ»ββοΈππ»ββοΈππ»ββοΈ"
    ]
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    // νλ‘μ νΈμ μ¬μ©λλ μκΉλ€ μ΄λ¦μ enumμΌλ‘ μ λ¦¬.
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
        
        // refresh κΈ°λ₯μ μν΄ tableViewμ UIRefreshControl κ°μ²΄λ₯Ό μ΄κΈ°ν νλ€ !!
        tableView.refreshControl = UIRefreshControl()
        // refreshλ‘ μμ μκΈ°λ λΆλΆ λ°°κ²½μ μ€μ .
        tableView.refreshControl?.backgroundColor = UIColor(named: usedColor.refresh.rawValue)
        // refresh λͺ¨μ μκΉ μ€μ .
        tableView.refreshControl?.tintColor = .white
    }
    
    // refreshControlμ title μ¬μ€μ (= μλ°μ΄νΈ).
    func updateRefreshTitle() {
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Last Updated \(updatedDate)", attributes: attributes)
    }
    
    func setupTargets() {
        // refresh νλ©΄ μ€νλ  ν¨μ μ°κ²°.
        tableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    // refresh νλ©΄ μ€νλ  ν¨μ.
    @objc func pullToRefresh() {
        // μ΅μ΄μ refreshμΌ λμλ§ μ΄λͺ¨μ§λ₯Ό μΆκ°νλ€.
        if numOfRuns == 0 {
            // νμ΄λΈλ·°μ μλ ₯λλ λ°μ΄ν°λ₯Ό κ°±μ νλ€!
            newEmojiArray.forEach { emojiArray.insert($0, at: 0) }
        }
        
        numOfRuns += 1
        
        // updatedDateλ₯Ό νμ¬λ‘ μλ°μ΄νΈ.
        updatedDate = Date.now
        // νμ΄ν μλ°μ΄νΈ.
        updateRefreshTitle()
        
        // νμ΄λΈλ·° μλ‘κ³ μΉ¨.
        tableView.reloadData()
        // λΉκΈ°λ κ² λλλ©΄ refreshλ λλλλ‘.
        tableView.refreshControl?.endRefreshing()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // μ κ°―μ μ€μ .
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiArray.count
    }
    
    // μ λμ΄ μ€μ .
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // μ λ΄μ© μ€μ .
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            preconditionFailure("νμ΄λΈ λ·° κ°μ Έμ€κΈ° μ€ν¨")
        }
        
        cell.emojiLabel.text = emojiArray[indexPath.row]
        
        return cell
    }
    
    // cellμ΄ νλ©΄μ λ³΄μ¬μ§κΈ° μ§μ μ νΈμΆλλ ν¨μ.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // μμ μλ λ°°κ²½μμ clear. -> λ΄κ° μμ μ§μ νκΈ° μν΄μ(?)
        cell.backgroundColor = UIColor.clear
    }
}
