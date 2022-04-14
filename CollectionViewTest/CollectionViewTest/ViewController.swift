//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by 서은수 on 2022/04/14.
//
// 참고 블로그 : https://ios-development.tistory.com/103

import UIKit

class ViewController: UIViewController {

    var list = ["1", "2", "3", "4" ,"5", "6", "7", "8", "9", "10"]

    // 연결된 클래스에 collectionView 변수로 연결 및 delegate 설정.
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
}

// cell data에 관한 DataSource 설정.
extension ViewController: UICollectionViewDataSource {
    
    // 아이템의 개수 설정.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    // 셀 생성.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = .lightGray
        cell.label.text = list[indexPath.row]
        
        return cell
    }
}

// cell layout에 대한 delegate 설정.
extension ViewController: UICollectionViewDelegateFlowLayout {

    // cell 위 아래 간격 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    // cell 옆 간격 설정.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    // cell 사이즈 ( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width / 3 - 1 /// 3등분하여 배치. 옆 간격이 1이므로 1을 빼 준 것.
        
        print("collectionView width = \(collectionView.frame.width)")
        print("cell 하나당 width = \(width)")
        print("root view width = \(self.view.frame.width)")

        let size = CGSize(width: width, height: width)
        return size
    }
}
